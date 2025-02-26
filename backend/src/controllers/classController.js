const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const getClasses = async (request, response) => {
  try {
    const classes = await prisma.class.findMany({
      select: {
        id: true,
        name: true,
      },
    })

    const resData = { classes }

    return response.status(200).json({ resData })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Failed to fetch data.',
    })
  }
}

module.exports = {
  getClasses,
}
