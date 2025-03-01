const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const isValidPlan = async (userId) => {
  const subscription = await prisma.userSubscription.findFirst({
    where: {
      userId,
      endDate: {
        gt: new Date(),
      },
    },
  })

  return !!subscription
}

const userPlan = async (userId) => {
  const subscription = await prisma.userSubscription.findFirst({
    where: {
      userId,
    },
    include: {
      plan: true,
    },
  })

  return !!subscription
}

module.exports = { isValidPlan, userPlan }
