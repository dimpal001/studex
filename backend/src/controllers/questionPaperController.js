const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const OpenAI = require('openai')
const openai = new OpenAI({
  apiKey: process.env.GPT_ACCESS_KEY,
})

const getQuestionPapers = async (request, response) => {
  const { userId, subjectId, paperId } = request.query
  try {
    if (!userId) {
      return response.status(400).json({ error: 'User data is missing' })
    }

    if (paperId) {
      const paper = await prisma.questionPaper.findUnique({
        where: {
          id: paperId,
        },
      })

      return response.status(200).json({ resData: paper })
    }

    const filter = { userId }
    if (subjectId) {
      filter.subjectId = subjectId
    }

    const papers = await prisma.questionPaper.findMany({
      where: filter,
    })

    return response.status(200).json({ resData: papers })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

const generateQuestionPaper = async (request, response) => {
  const {
    userId,
    subjectId,
    topic = null,
    classId,
    marks = null,
    language = 'english',
    duration = null,
  } = request.body
  try {
    if (!subjectId) {
      return response.status(400).json({ message: 'Subject data is missing' })
    }
    if (!classId) {
      return response.status(400).json({ message: 'Class data is missing' })
    }

    const subjectData = await prisma.subject.findUnique({
      where: { id: subjectId },
      select: { name: true },
    })
    const classData = await prisma.class.findUnique({
      where: { id: classId },
      select: { name: true },
    })

    const prompt = `Generate a JSON format question paper.
    Subject ${subjectData.name}, Class ${classData.name}
    ${topic ? `Topic ${topic}` : ''}
    ${marks ? `Marks ${marks}` : ''}
    ${duration ? `Duration ${duration} mn` : ''}
    ${language ? `in ${language}` : ''}
    Response should be in JSON
    {
    "name": "Standard Exam Name",
    "data": "Markdown formatted question paper"
    }`

    const aiResponse = await openai.chat.completions.create({
      model: 'gpt-4o-mini',
      messages: [{ role: 'user', content: prompt }],
      //   response_format: 'json',
    })

    const responseContent = aiResponse.choices[0].message.content
    const rawJson = responseContent.replace('```json\n', '').replace('```', '')

    const paperData = JSON.parse(rawJson)

    if (!paperData) {
      return response
        .status(400)
        .json({ message: 'Unable to generate response' })
    }

    const paper = await prisma.questionPaper.create({
      data: {
        userId,
        name: paperData.name,
        subjectId,
        classId,
        marks,
        topic,
        duration,
        language,
        data: paperData.data,
      },
      select: {
        id: true,
        name: true,
        createdAt: true,
        marks: true,
        duration: true,
      },
    })

    const resData = { paper }

    return response
      .status(200)
      .json({ resData, message: 'Question paper generated successfully' })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'Something went wrong.',
    })
  }
}

module.exports = {
  getQuestionPapers,
  generateQuestionPaper,
}
