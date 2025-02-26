const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const getSubjects = async (request, response) => {
  try {
    const subjects = await prisma.subject.findMany({
      select: {
        id: true,
        name: true,
      },
    })

    const resData = { subjects }

    return response.status(200).json({ resData })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Failed to fetch data.',
    })
  }
}

module.exports = {
  getSubjects,
}
