const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const getChapters = async (request, response) => {
  const { subjectId, userId } = request.query
  try {
    if (!subjectId || !userId) {
      return response
        .status(400)
        .json({ error: 'Subject and User data are missing' })
    }

    const chapters = await prisma.chapter.findMany({
      where: {
        subjectId,
        userId,
      },
      include: {
        _count: {
          select: { questions: true },
        },
      },
    })

    const resData = chapters.map((chapter) => ({
      id: chapter.id,
      name: chapter.name,
      userId: chapter.userId,
      subjectId: chapter.subjectId,
      createdAt: chapter.createdAt,
      questions: chapter._count.questions,
    }))

    return response.status(200).json({ resData })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

const addChapter = async (request, response) => {
  const { subjectId, userId, name } = request.body
  console.log(request.body)
  try {
    if (!subjectId || !userId || !name) {
      return response
        .status(400)
        .json({ error: 'Subject data, User data and Chapter data are missing' })
    }
    const chapter = await prisma.chapter.create({
      data: {
        subjectId,
        userId,
        name,
      },
    })

    const resData = { chapter }

    return response
      .status(200)
      .json({ resData, message: 'Chapter added successfully' })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

const updatedChapter = async (request, response) => {
  const { id, subjectId, name } = request.body
  try {
    if (!subjectId || !id) {
      return response
        .status(400)
        .json({ error: 'Subject data and Chapter data are missing' })
    }
    let chapter
    if (name) {
      chapter = await prisma.chapter.update({
        where: {
          id,
        },
        data: {
          name,
        },
      })
    } else {
      chapter = await prisma.chapter.update({
        where: {
          id,
        },
        data: {
          subjectId,
        },
      })
    }

    const resData = { chapter }

    return response
      .status(200)
      .json({ resData, message: 'Chapter updated successfully' })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

const deleteChapter = async (request, response) => {
  const { id } = request.query
  try {
    if (!id) {
      return response.status(400).json({ error: 'Chapter data is missing' })
    }

    const chapter = await prisma.chapter.delete({
      where: {
        id,
      },
    })

    const resData = { chapter }

    return response
      .status(200)
      .json({ resData, message: 'Chapter deleted successfully' })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

module.exports = {
  getChapters,
  addChapter,
  updatedChapter,
  deleteChapter,
}
