const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const { PrismaClient } = require('@prisma/client')
const { decryptData, encryptData } = require('../utils')

const prisma = new PrismaClient()

const signUp = async (request, response) => {
  const decryptedData = decryptData(request.body.data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { phoneNumber } = decryptedData

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

    const resData = encryptData({ message: 'OTP sent successfully' })

    response.status(201).json({ resData })
  } catch (error) {
    console.error(error?.response?.data || error.message)
    return response.status(500).json({
      error: 'Registration failed',
    })
  }
}

const verifyOtp = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { otp, phoneNumber } = decryptedData

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

    const resData = encryptData({ message: 'OTP verified successfully' })

    return response.status(201).json({ resData })
  } catch (error) {
    console.log(error)
    return response.status(500).json({
      error: 'OTP Verification failed',
    })
  }
}

const createUser = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { phoneNumber, password, deviceId } = decryptedData

  try {
    if (!phoneNumber || !password || !deviceId) {
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

    const token = jwt.sign(
      { userId: user.id, phoneNumber, deviceId },
      process.env.JWT_SECRET,
      {
        expiresIn: '30d',
      }
    )

    await prisma.session.create({
      data: {
        userId: user.id,
        token,
        deviceId,
      },
    })

    const resData = encryptData({
      message: 'You have successfully registered!',
      token,
      userId: user.id,
    })

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'User creation failed' })
  }
}

const login = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { phoneNumber, password, deviceId, fcmToken } = decryptedData

  try {
    if (!phoneNumber || !password || !deviceId) {
      return response.status(400).json({
        error: 'Phone number, password, and device ID are required',
      })
    }

    const user = await prisma.user.findUnique({ where: { phoneNumber } })
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

    if (existingSession) {
      if (existingSession.deviceId !== deviceId) {
        return response.status(403).json({
          error: 'You are already logged in on another device',
        })
      }
      await prisma.session.deleteMany({ where: { userId: user.id } })
    }

    const token = jwt.sign(
      { userId: user.id, phoneNumber, deviceId },
      process.env.JWT_SECRET,
      { expiresIn: '30d' }
    )

    await prisma.session.create({
      data: {
        userId: user.id,
        token,
        deviceId,
      },
    })

    const resData = encryptData({ message: 'Login successful', user, token })

    return response.status(200).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Login failed' })
  }
}

const forceLogin = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { phoneNumber, password, deviceId } = decryptedData

  try {
    if (!phoneNumber || !password || !deviceId) {
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
        deviceId,
      },
    })

    const resData = encryptData({
      message: 'Login successful, previous device logged out',
      user,
      token,
    })

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Login failed' })
  }
}

module.exports = { signUp, verifyOtp, createUser, login, forceLogin }
