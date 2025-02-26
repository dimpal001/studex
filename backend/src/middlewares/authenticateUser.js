const { PrismaClient } = require('@prisma/client')
const jwt = require('jsonwebtoken')
const prisma = new PrismaClient()

const authenticateUser = async (request, response, next) => {
  const token = request.headers.authorization?.split(' ')[1]

  if (!token) {
    return response
      .status(401)
      .json({ error: 'Unauthorized: No token provided' })
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET)

    const session = await prisma.session.findFirst({
      where: { token },
    })

    if (!session) {
      return response
        .status(401)
        .json({ error: 'Session expired or logged out' })
    }

    request.user = decoded
    next()
  } catch (error) {
    console.log(error)
    return response.status(401).json({ error: 'Invalid token' })
  }
}

module.exports = authenticateUser
