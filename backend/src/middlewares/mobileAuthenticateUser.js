const jwt = require('jsonwebtoken')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const mobileAuthenticateUser = async (request, response, next) => {
  const token = request.headers.authorization?.split(' ')[1]
  const fcmToken = request.headers['fcm-token']

  if (!token) {
    return response
      .status(401)
      .json({ error: 'Unauthorized: No token provided' })
  }

  //   if (!fcmToken) {
  //     return response
  //       .status(400)
  //       .json({ error: 'Bad Request: Some data are missing' })
  //   }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET)

    const session = await prisma.session.findFirst({
      where: { token },
    })

    const isFcmValid = await prisma.user.findUnique({
      where: {
        id: decoded.userId,
        fcmToken: fcmToken,
      },
    })

    // if (!isFcmValid) {
    //   return response
    //     .status(400)
    //     .json({ error: 'Bad Request: Invalid data provided' })
    // }

    if (!session) {
      return response
        .status(401)
        .json({ error: 'Session expired or logged out' })
    }

    request.user = decoded
    request.fcmToken = fcmToken

    next()
  } catch (error) {
    console.log(error)
    return response.status(401).json({ error: 'Invalid token' })
  }
}

module.exports = mobileAuthenticateUser
