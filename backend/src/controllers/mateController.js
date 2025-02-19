const { PrismaClient } = require('@prisma/client')
const OpenAI = require('openai')
const { sendNotification } = require('../middlewares/sendNotification')
const { decryptData, encryptData } = require('../utils')

const prisma = new PrismaClient()
const openai = new OpenAI({
  apiKey: process.env.GPT_ACCESS_KEY,
})

const sendMateRequest = async (request, response) => {
  const { data } = request.body

  if (!data) {
    response.status(400).json({ message: 'Required data is not provided!' })
  }

  const { decryptedData } = decryptData(data)

  if (!decryptedData) {
    response.status(400).json({ message: 'Invalid encrypted data' })
  }
  const { followerId, followingId } = decryptedData

  try {
    await prisma.userInteraction.create({
      data: {
        followerId,
        followingId,
      },
    })

    response
      .status(200)
      .json({ message: 'You have successfully send a mate request' })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const respondMateRequest = async (request, response) => {
  const { data } = request.body

  if (!data) {
    response.status(400).json({ message: 'Required data is not provided!' })
  }

  const { decryptedData } = decryptData(data)

  if (!decryptedData) {
    response.status(400).json({ message: 'Invalid encrypted data' })
  }
  const { followerId, followingId, status } = decryptedData

  try {
    await prisma.userInteraction.update({
      where: { followerId, followingId },
      data: {
        status,
      },
    })

    response
      .status(200)
      .json({ message: `You have successfully ${status} the request` })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const disconnectMate = async (request, response) => {
  const { data } = request.body

  if (!data) {
    response.status(400).json({ message: 'Required data is not provided!' })
  }

  const { decryptedData } = decryptData(data)

  if (!decryptedData) {
    response.status(400).json({ message: 'Invalid encrypted data' })
  }
  const { followerId, followingId } = decryptedData

  try {
    await prisma.userInteraction.delete({
      where: {
        followerId,
        followingId,
      },
    })

    response.status(200).json({ message: `Disconnection successful` })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const mateList = async (request, response) => {
  const { followerId } = request.query

  if (!followerId) {
    response.status(400).json({ message: 'Required data is not provided!' })
  }

  try {
    const mates = await prisma.userInteraction.findMany({
      where: {
        followerId,
      },
      select: {
        user: {
          select: {
            id: true,
            fullName: true,
            profileUrl: true,
            class: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
        createdAt: true,
      },
    })

    const resData = encryptData(mates)

    response.status(200).json({ resData })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

module.exports = {
  sendMateRequest,
  respondMateRequest,
  disconnectMate,
  mateList,
}
