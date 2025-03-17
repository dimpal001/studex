const { PrismaClient } = require('@prisma/client')
const OpenAI = require('openai')

const prisma = new PrismaClient()

const searchUser = async (request, response) => {
  const { query, userId, page = 0 } = request.query

  try {
    const pageNumber = parseInt(page) || 0
    const pageSize = 20

    const users = await prisma.user.findMany({
      where: {
        OR: [{ fullName: { contains: query, mode: 'insensitive' } }],
        NOT: { id: userId },
      },
      select: {
        id: true,
        class: true,
        fullName: true,
        profileUrl: true,
        bio: true,
      },
      skip: pageNumber * pageSize,
      take: pageSize,
    })

    const userIds = users.map((user) => user.id)

    const interactions = await prisma.userInteraction.findMany({
      where: {
        OR: [
          { followerId: userId, followingId: { in: userIds } },
          { followingId: userId, followerId: { in: userIds } },
        ],
      },
    })

    const updatedUsers = users.map((user) => {
      const interaction = interactions.find(
        (i) =>
          (i.followerId === userId && i.followingId === user.id) ||
          (i.followerId === user.id && i.followingId === userId)
      )

      let status = 'Follow'

      if (interaction) {
        if (interaction.status === 'ACCEPTED') {
          status = 'Friend'
        } else if (interaction.followerId === userId) {
          status = interaction.status === 'PENDING' ? 'Requested' : 'Follow'
        } else if (interaction.followingId === userId) {
          status = interaction.status === 'PENDING' ? 'Accept' : 'Follow'
        }
      }

      return { ...user, status }
    })

    response.status(200).json({
      success: true,
      users: updatedUsers,
      hasMore: users.length === pageSize,
    })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const sendFriendRequest = async (request, response) => {
  const { followerId, followingId } = request.body

  try {
    await prisma.userInteraction.create({
      data: {
        followerId,
        followingId,
      },
    })

    response
      .status(200)
      .json({ message: 'You have successfully send a friend request' })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const respondFriendRequest = async (request, response) => {
  const { followerId, followingId, status } = request.body

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

const unfriend = async (request, response) => {
  const { followerId, followingId } = request.body

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

const friendList = async (request, response) => {
  const { userId } = request.query

  if (!userId) {
    response.status(400).json({ message: 'Required data is not provided!' })
  }

  try {
    const friends = await prisma.userInteraction.findMany({
      where: {
        OR: [{ followerId: userId }, { followingId: userId }],
      },
      include: {
        follower: {
          include: {
            class: true,
          },
        },
      },
    })

    response.status(200).json({ friends })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

module.exports = {
  searchUser,
  sendFriendRequest,
  respondFriendRequest,
  unfriend,
  friendList,
}
