const { PrismaClient } = require('@prisma/client')

const fs = require('fs')
const { promisify } = require('util')
const unlinkAsync = promisify(fs.unlink)
const TOKEN_LIMIT = 500

const prisma = new PrismaClient()
const OpenAI = require('openai')
const convertImageToText = require('../functions/convertImageToText')
const { error } = require('console')
const openai = new OpenAI({
  baseURL: 'https://api.deepseek.com',
  // apiKey: process.env.GPT_ACCESS_KEY,
  apiKey: process.env.DEEPSEEK_KEY,
})

const askQuestion = async (request, response) => {
  const {
    userId,
    question,
    subjectData = null,
    classData = null,
    marks = null,
    language = null,
  } = request.body

  const image = request.file
  let extractedText = ''
  let finalQuestion = question

  try {
    if (!userId || (!question && !image)) {
      return response
        .status(400)
        .json({ error: 'Question, image, or User data is missing' })
    }

    // if (question) {
    //   return response
    //     .status(400)
    //     .json({ error: 'This feature is not allowed to your plan' })
    // }

    if (image) {
      console.log('Image is there')
      extractedText = await convertImageToText(image.path)
      await unlinkAsync(image.path)
      console.log(extractedText)

      if (!extractedText.trim()) {
        return response
          .status(400)
          .json({ error: 'Failed to extract text from image' })
      }

      finalQuestion =
        extractedText.length > TOKEN_LIMIT
          ? extractedText.substring(0, TOKEN_LIMIT)
          : extractedText
    }

    const prompt = image
      ? `Treat texts as question.Provide an optimized version and answer.
      Extracted Text: "${finalQuestion}"
      ${subjectData ? `Subject ${subjectData}` : ''}
      ${classData ? `Class ${classData.name}` : ''}
      ${marks ? `Marks ${marks}` : ''}
      ${
        language && language.toLowerCase() !== 'english' ? `in ${language}` : ''
      }
      Response should be in JSON format
      {
        "question": "Optimized question markdown",
        "answer": "Markdown formatted answer"
      }`
      : `Optimize the given question and generate an answer.
      Question "${finalQuestion}"
      ${subjectData ? `Subject ${subjectData}` : ''}
      ${classData ? `Class ${classData.name}` : ''}
      ${marks ? `Marks ${marks}` : ''}
      ${
        language && language.toLowerCase() !== 'english' ? `in ${language}` : ''
      }
      Response should be in JSON format
      {
        "question": "Optimized version of the question",
        "answer": "Markdown formatted answer"
      }`

    const aiResponse = await openai.chat.completions.create({
      model: 'deepseek-chat',
      messages: [
        { role: 'system', content: 'You are Studex AI, powered by DeepSeek.' },
        { role: 'user', content: prompt },
      ],
    })

    const responseContent = aiResponse.choices[0].message.content
    console.log(responseContent)
    const rawJson = responseContent.replace('```json\n', '').replace('```', '')

    const questionData = JSON.parse(rawJson)

    const result = await prisma.$transaction(async (tx) => {
      const userQuestion = await tx.question.create({
        data: {
          userId,
          content: questionData.question,
          classId: classData?.id || null,
          subjectId: subjectData?.id || null,
          marks: marks || null,
        },
        include: { answers: true },
      })

      const questionAnswer = await tx.answer.create({
        data: {
          questionId: userQuestion.id,
          content: questionData.answer,
        },
      })

      return { ...userQuestion, answers: [questionAnswer] }
    })

    // const result = await prisma.question.findFirst({
    //   select: {
    //     id: true,
    //     content: true,
    //     answers: {
    //       select: {
    //         content: true,
    //       },
    //     },
    //   },
    //   skip: 2,
    // })

    return response.status(200).json({ resData: result })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed generating response.',
    })
  }
}

const getLatestQuestion = async (request, response) => {
  const { userId, page = 0 } = request.query
  console.log('Its calling : ', page)
  try {
    if (!userId) {
      return response.status(400).json({ error: 'User data is missing' })
    }

    const latestQuestions = await prisma.question.findMany({
      where: { userId },
      orderBy: { createdAt: 'desc' },
      skip: 10 * page,
      take: 10,
      select: {
        id: true,
        createdAt: true,
        content: true,
        marks: true,
        subject: {
          select: {
            name: true,
          },
        },
        chapter: {
          select: {
            name: true,
          },
        },
      },
    })

    return response.status(200).json({ resData: latestQuestions })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getDetailQuestion = async (request, response) => {
  const { questionId } = request.query
  console.log('Its calling : ', questionId)
  try {
    if (!questionId) {
      return response.status(400).json({ error: 'Question data is missing' })
    }

    const detailQuestion = await prisma.question.findUnique({
      where: { id: questionId },
      select: {
        id: true,
        createdAt: true,
        content: true,
        marks: true,
        answers: true,
        subject: {
          select: {
            name: true,
          },
        },
        chapter: {
          select: {
            name: true,
          },
        },
      },
    })

    return response.status(200).json({ resData: detailQuestion })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getSubjectWiseQuestion = async (request, response) => {
  const { userId, subjectId, page = 0 } = request.query
  console.log(userId)
  console.log(subjectId)
  console.log(page)

  try {
    if (!userId || !subjectId) {
      return response
        .status(400)
        .json({ error: 'User and Subject data are missing' })
    }

    const noOfQuestions = await prisma.question.count({
      where: { userId, subjectId },
    })

    const questions = await prisma.question.findMany({
      where: { userId, subjectId },
      orderBy: { createdAt: 'desc' },
      skip: 10 * page,
      take: 10,
      select: {
        id: true,
        content: true,
        createdAt: true,
        subject: true,
        chapter: true,
      },
    })

    return response.status(200).json({ resData: questions, noOfQuestions })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getChapterWiseQuestion = async (request, response) => {
  const { userId, chapterId } = request.query
  try {
    if (!userId || !chapterId) {
      return response
        .status(400)
        .json({ error: 'User and Chapter data are missing' })
    }

    const questions = await prisma.question.findMany({
      where: { userId, chapterId },
      orderBy: { createdAt: 'desc' },
      take: 10,
      include: { answers: true, subject: true, chapter: true },
    })

    return response.status(200).json({ resData: questions })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getSearQuestion = async (request, response) => {
  const { userId, query } = request.query
  try {
    if (!userId || !query) {
      return response
        .status(400)
        .json({ error: 'Query and User data are missing' })
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

    return response.status(200).json({ resData: questions })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const addToChapter = async (request, response) => {
  try {
    const { userId, chapterId, questionId } = request.body.data

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

    const resData = { question }

    return response
      .status(200)
      .json({ resData, message: 'Question has been added' })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed adding question.',
      details: error.message,
    })
  }
}

const moveToAnotherChapter = async (request, response) => {
  const { id, chapterId } = request.body
  console.log(id)
  console.log(chapterId)
  try {
    if (!id || !chapterId) {
      return response
        .status(400)
        .json({ error: 'Question and Chapter data are missing' })
    }

    const question = await prisma.question.update({
      where: {
        id,
      },
      data: {
        chapterId,
      },
    })

    const resData = { question }

    return response
      .status(200)
      .json({ resData, message: 'Question has been moved' })
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
  getDetailQuestion,
  getSubjectWiseQuestion,
  getChapterWiseQuestion,
  getSearQuestion,
  addToChapter,
  moveToAnotherChapter,
}
