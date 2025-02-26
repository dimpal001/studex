const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const { PrismaClient } = require('@prisma/client')
const { decryptData, encryptData } = require('../utils')

const prisma = new PrismaClient()

const signUp = async (request, response) => {
  const { phoneNumber } = request.body.data

  const PHONE_NUMBER_ID = process.env.PHONE_NUMBER_ID
  const ACCESS_TOKEN = process.env.ACCESS_TOKEN

  const otp = Math.floor(100000 + Math.random() * 900000)

  try {
    if (!phoneNumber || phoneNumber.length !== 10) {
      return response
        .status(400)
        .json({ error: 'Enter a valid 10 digits phone number' })
    }

    const phoneRegex = /^[6789]\d{9}$/
    if (!phoneRegex.test(phoneNumber)) {
      return response.status(400).json({ error: 'Invalid phone number format' })
    }

    const existingUser = await prisma.user.findUnique({
      where: { phoneNumber },
    })

    if (existingUser) {
      return response
        .status(400)
        .json({ error: 'Phone number is already registered' })
    }

    // await axios.post(
    //   `https://graph.facebook.com/v21.0/${PHONE_NUMBER_ID}/messages`,
    //   {
    //     messaging_product: 'whatsapp',
    //     to: phoneNumber,
    //     type: 'template',
    //     template: {
    //       name: 'send_otp',
    //       language: { code: 'en_US' },
    //       components: [
    //         {
    //           type: 'body',
    //           parameters: [
    //             {
    //               type: 'text',
    //               text: `${otp}`,
    //             },
    //           ],
    //         },
    //       ],
    //     },
    //   },
    //   {
    //     headers: {
    //       Authorization: `Bearer ${ACCESS_TOKEN}`,
    //       'Content-Type': 'application/json',
    //     },
    //   }
    // )

    const expiresAt = new Date(Date.now() + 5 * 60 * 1000)

    await prisma.otp.create({
      data: {
        code: otp.toString(),
        phoneNumber,
        expiresAt,
      },
    })

    const resData = { message: 'OTP sent successfully' }

    response.status(201).json({ resData })
  } catch (error) {
    console.error(error?.response?.data || error.message)
    return response.status(500).json({
      error: 'Registration failed',
    })
  }
}

const verifyOtp = async (request, response) => {
  const { otp, phoneNumber } = request.body.data

  try {
    const otpRecord = await prisma.otp.findFirst({
      where: {
        phoneNumber,
        code: otp,
      },
    })

    if (!otpRecord) {
      return response.status(400).json({ error: 'Invalid OTP' })
    }

    const otpExpiration = await prisma.otp.findFirst({
      where: {
        phoneNumber,
        code: otp,
        expiresAt: {
          gt: new Date(),
        },
      },
    })

    if (!otpExpiration) {
      return response.status(400).json({ error: 'Expired OTP' })
    }

    await prisma.otp.delete({
      where: { id: otpRecord.id },
    })

    const resData = { message: 'OTP verified successfully' }

    return response.status(200).json({ resData })
  } catch (error) {
    console.log(error)
    return response.status(500).json({
      error: 'OTP Verification failed',
    })
  }
}

const createUser = async (request, response) => {
  const { phoneNumber, password } = request.body.data

  try {
    if (!phoneNumber || !password) {
      return response
        .status(400)
        .json({ error: 'Phone number and password are required' })
    }

    const phoneRegex = /^[6789]\d{9}$/
    if (!phoneRegex.test(phoneNumber)) {
      return response.status(400).json({ error: 'Invalid phone number format' })
    }

    let user = await prisma.user.findUnique({ where: { phoneNumber } })

    if (user) {
      return response
        .status(400)
        .json({ error: 'Phone number is already registered' })
    }

    const hashedPassword = await bcrypt.hash(password, 10)

    user = await prisma.user.create({
      data: {
        phoneNumber,
        password: hashedPassword,
      },
    })

    const resData = {
      message: 'You have successfully registered!',
      user,
    }

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'User creation failed' })
  }
}

const updateUserData = async (request, response) => {
  const { id, fullName, classId, subjects } = request.body.data

  try {
    const updatedUser = await prisma.user.update({
      where: { id },
      data: {
        fullName,
        classId,
      },
      include: {
        class: true,
        subjects: {
          include: {
            subject: true,
          },
        },
      },
    })

    if (subjects && subjects.length > 0) {
      await prisma.userSubject.deleteMany({ where: { userId: id } })

      await prisma.userSubject.createMany({
        data: subjects.map((subjectId) => ({ userId: id, subjectId })),
      })
    }

    const classData = await prisma.class.findUnique({
      where: { id: classId },
    })

    const subjectData = await prisma.userSubject.findMany({
      where: { userId: id },
      include: { subject: true },
    })

    const token = jwt.sign(
      { userId: updatedUser.id, phoneNumber: updatedUser.phoneNumber },
      process.env.JWT_SECRET,
      {
        expiresIn: '30d',
      }
    )

    await prisma.session.create({
      data: {
        userId: updatedUser.id,
        token,
      },
    })

    const resData = { classData, subjectData, updatedUser, token }

    return response.status(200).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Update failed' })
  }
}

const login = async (request, response) => {
  const { phoneNumber, password, fcmToken } = request.body.data

  try {
    if (!phoneNumber || !password) {
      return response.status(400).json({
        error: 'Phone number, password, and device ID are required',
      })
    }

    const user = await prisma.user.findUnique({
      where: { phoneNumber },
      include: { class: true },
    })
    if (!user) {
      return response.status(400).json({ error: 'User not found' })
    }

    const passwordMatch = await bcrypt.compare(password, user.password)
    if (!passwordMatch) {
      return response.status(400).json({ error: 'Incorrect password' })
    }

    const existingSession = await prisma.session.findUnique({
      where: { userId: user.id },
    })

    await prisma.user.update({
      where: { phoneNumber },
      data: { fcmToken },
    })

    const token = jwt.sign(
      { userId: user.id, phoneNumber },
      process.env.JWT_SECRET,
      { expiresIn: '30d' }
    )

    await prisma.session.create({
      data: {
        userId: user.id,
        token,
      },
    })

    const resData = { message: 'Login successful', user, token }

    return response.status(200).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Login failed' })
  }
}

const forceLogin = async (request, response) => {
  const { phoneNumber, password } = request.body.data

  try {
    if (!phoneNumber || !password) {
      return response.status(400).json({
        error: 'Phone number and password are required',
      })
    }

    const user = await prisma.user.findUnique({ where: { phoneNumber } })
    if (!user) {
      return response.status(400).json({ error: 'User not found' })
    }

    const passwordMatch = bcrypt.compare(password, user.password)
    if (!passwordMatch) {
      return response.status(400).json({ error: 'Incorrect password' })
    }

    await prisma.session.deleteMany({ where: { userId: user.id } })

    const token = jwt.sign(
      { userId: user.id, phoneNumber },
      process.env.JWT_SECRET,
      { expiresIn: '30d' }
    )

    await prisma.session.create({
      data: {
        userId: user.id,
        token,
      },
    })

    const resData = {
      message: 'Login successful, previous device logged out',
      user,
      token,
    }

    return response.status(200).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Login failed' })
  }
}

module.exports = {
  signUp,
  verifyOtp,
  createUser,
  login,
  forceLogin,
  updateUserData,
}
