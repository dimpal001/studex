const { PrismaClient } = require('@prisma/client')
const { decryptData, encryptData, askAi } = require('../utils')

const prisma = new PrismaClient()

const askQuestion = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const {
      userId,
      question,
      subjectData = null,
      boardData = null,
      classData = null,
      marks = null,
      language = null,
    } = decryptedData

    const className = await prisma.class.findUnique({
      where: { id: classData },
    })

    const questionPrompt = `make proper question ${
      language ? `in ${language?.toLowerCase()}` : ''
    }->${question}`

    const answerPrompt = `${question}${subjectData ? `, ${subjectData}` : ''}${
      className ? `, ${className?.name}` : ''
    }${marks ? ` for ${marks} marks` : ''}${
      language && language?.toLowerCase() !== 'english'
        ? ` in ${language?.toLowerCase()} answer in markdown format`
        : ''
    }`

    console.log(questionPrompt)
    console.log(answerPrompt)

    // const aiQuestionResponse = await askAi(questionPrompt)
    // const aiAnswerResponse = await askAi(answerPrompt)

    // console.log(aiQuestionResponse)
    // console.log(aiAnswerResponse)

    if (!userId || !question) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    // const result = await prisma.$transaction(async (tx) => {
    //   const userQuestion = await tx.question.create({
    //     data: {
    //       userId,
    //       content: question,
    //       boardId: boardData?.id || null,
    //       classId: classData?.id || null,
    //       subjectId: subjectData?.id || null,
    //       marks: marks || null,
    //     },
    //     include: { answers: true },
    //   })

    //   const questionAnswer = await tx.answer.create({
    //     data: {
    //       questionId: userQuestion.id,
    //       content:
    //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
    //     },
    //   })

    //   return { ...userQuestion, answers: [questionAnswer] }
    // })

    // const resData = encryptData(result)

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed generating response.',
    })
  }
}

const getLatestQuestion = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const { userId } = decryptedData

    if (!userId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const latestQuestions = await prisma.question.findMany({
      where: { userId },
      orderBy: { createdAt: 'desc' },
      take: 10,
      include: { answers: true, subject: true, chapter: true },
    })

    const resData = encryptData(latestQuestions)

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getSubjectWiseQuestion = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const { userId, subjectId } = decryptedData

    if (!userId || !subjectId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const questions = await prisma.question.findMany({
      where: { userId, subjectId },
      orderBy: { createdAt: 'desc' },
      take: 10,
      include: { answers: true, subject: true, chapter: true },
    })

    const resData = encryptData(questions)

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getChapterWiseQuestion = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const { userId, chapterId } = decryptedData

    if (!userId || !chapterId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const questions = await prisma.question.findMany({
      where: { userId, chapterId },
      orderBy: { createdAt: 'desc' },
      take: 10,
      include: { answers: true, subject: true, chapter: true },
    })

    const resData = encryptData(questions)

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getSearQuestion = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const { userId, query } = decryptedData

    if (!userId || !query) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const questions = await prisma.question.findMany({
      where: {
        userId,
        content: {
          contains: query,
          mode: 'insensitive',
        },
      },
      orderBy: { createdAt: 'desc' },
      include: { answers: true },
    })

    const resData = encryptData({ questions })

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const addToChapter = async (request, response) => {
  try {
    const decryptedData = decryptData(request.body.data)

    if (!decryptedData) {
      return response.status(400).json({ error: 'Data format is invalid' })
    }

    const { userId, chapterId, questionId } = decryptedData

    if (!userId || !chapterId || !questionId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const question = await prisma.question.findUnique({
      where: {
        id: questionId,
      },
      data: {
        chapterId,
      },
    })

    const resData = encryptData({
      question,
      message: 'Question has been added',
    })

    return response.status(200).json({ resData })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed adding question.',
      details: error.message,
    })
  }
}

module.exports = {
  askQuestion,
  getLatestQuestion,
  getSubjectWiseQuestion,
  getChapterWiseQuestion,
  getSearQuestion,
  addToChapter,
}
