const { PrismaClient } = require('@prisma/client')
const OpenAI = require('openai')
const { sendNotification } = require('../middlewares/sendNotification')

const prisma = new PrismaClient()
const openai = new OpenAI({
  apiKey: process.env.GPT_ACCESS_KEY,
})

const createExam = async (request, response) => {
  try {
    const { name, userId, subjectId, topic, duration, noOfQuestions } =
      request.body

    if (
      !name ||
      !userId ||
      !subjectId ||
      !topic ||
      !duration ||
      !noOfQuestions
    ) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const subject = await prisma.subject.findUnique({
      where: { id: subjectId },
    })
    if (!subject) {
      return response.status(404).json({ error: 'Subject not found' })
    }

    const prompt = `Generate ${noOfQuestions} multiple-choice questions on "${topic}" in ${subject.name} with 4 options and correct answers. Format: JSON [{"question": "", "options": ["", "", "", ""], "answer": ""}]`

    const aiResponse = await openai.chat.completions.create({
      model: 'gpt-4o-mini',
      messages: [{ role: 'user', content: prompt }],
    })

    if (!aiResponse.choices || aiResponse.choices.length === 0) {
      return response
        .status(500)
        .json({ error: 'Failed to generate questions' })
    }

    const responseContent = aiResponse.choices[0].message.content
    const rawJson = responseContent.replace('```json\n', '').replace('```', '')

    let questions
    try {
      questions = JSON.parse(rawJson)
    } catch (err) {
      return response.status(500).json({ error: 'Failed to parse response' })
    }

    const exam = await prisma.exam.create({
      data: {
        userId,
        name,
        subjectId,
        topic,
        duration: parseInt(duration),
        noOfQuestions: parseInt(noOfQuestions),
      },
    })

    const examQuestions = questions.map((q) => ({
      examId: exam.id,
      question: q.question,
      optionA: q.options[0],
      optionB: q.options[1],
      optionC: q.options[2],
      optionD: q.options[3],
      correctAns: q.answer,
    }))

    await prisma.examQuestion.createMany({
      data: examQuestions,
    })

    return response.status(200).json({
      message: 'Exam created successfully',
      exam,
    })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed generating response.',
    })
  }
}

const submitExamAttempt = async (req, res) => {
  const { userId, examId, answers } = req.body

  try {
    let correctAnswers = 0
    let attemptedQuestions = 0
    let totalQuestions = answers.length

    const attempt = await prisma.examAttempt.create({
      data: {
        userId,
        examId,
        status: 'IN_PROGRESS',
      },
    })

    for (const ans of answers) {
      if (!ans.userAnswer || ans.userAnswer.trim() === '') {
        continue
      }

      attemptedQuestions++

      const question = await prisma.examQuestion.findUnique({
        where: { id: ans.questionId },
      })

      if (question.correctAns === ans.userAnswer) {
        correctAnswers++
      }

      await prisma.examQuestion.update({
        where: { id: ans.questionId },
        data: { userAnswer: ans.userAnswer },
      })
    }

    const result =
      attemptedQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0

    await prisma.examAttempt.update({
      where: { id: attempt.id },
      data: { status: 'COMPLETED', result },
    })

    res.json({ success: true, result, attemptedQuestions, totalQuestions })
  } catch (error) {
    console.log(error)
    res
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const challengeUser = async (request, response) => {
  const { senderId, receiverId, examId } = request.body

  try {
    const challenge = await prisma.challenge.create({
      data: {
        senderId,
        receiverId,
        examId,
        status: 'PENDING',
      },
    })

    const sender = await prisma.user.findUnique({ where: { id: senderId } })

    await prisma.notification.create({
      data: {
        userId: receiverId,
        title: `${sender.fullName} has challenged you!`,
        image: sender?.profileUrl || null,
        message: `${sender.fullName} thinks they can beat you in an exam! Prove them wrong. Accept the challenge now!`,
      },
    })

    response.json({ success: true, challenge })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const acceptChallenge = async (request, response) => {
  const { challengeId } = request.body

  try {
    const challenge = await prisma.challenge.update({
      where: { id: challengeId },
      data: { status: 'ACCEPTED' },
      include: { receiver: true, sender: true },
    })

    if (!challenge) {
      return response
        .status(404)
        .json({ success: false, error: 'Challenge not found' })
    }

    const receiverName = challenge.receiver.name
    const senderId = challenge.senderId
    const receiverProfileImage = challenge.receiver?.profileUrl || null

    const notificationTitle = `Challenge Accepted!`
    const notificationMessage = `🔥 ${receiverName} just accepted your challenge! Get ready to battle it out in the exam! 💥`

    await prisma.notification.create({
      data: {
        userId: senderId,
        title: notificationTitle,
        image: receiverProfileImage,
        message: notificationMessage,
        read: false,
      },
    })

    const sender = await prisma.user.findUnique({
      where: { id: senderId },
      select: { fcmToken: true },
    })

    response.json({ success: true, challenge })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const rejectChallenge = async (request, response) => {
  const { challengeId } = request.body

  try {
    const challenge = await prisma.challenge.update({
      where: { id: challengeId },
      data: { status: 'REJECTED' },
      include: { receiver: true, sender: true },
    })

    if (!challenge) {
      return response
        .status(404)
        .json({ success: false, error: 'Challenge not found' })
    }

    const receiverName = challenge.receiver.name
    const senderId = challenge.senderId
    const receiverProfileImage = challenge.receiver?.profileUrl || null

    const notificationTitle = `Challenge Declined`
    const notificationMessage = `😔 ${receiverName} has declined your challenge. Try challenging someone else! 💪`

    await prisma.notification.create({
      data: {
        userId: senderId,
        title: notificationTitle,
        image: receiverProfileImage,
        message: notificationMessage,
        read: false,
      },
    })

    const sender = await prisma.user.findUnique({
      where: { id: senderId },
      select: { fcmToken: true },
    })

    response.json({ success: true, challenge })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const deleteExam = async (request, response) => {
  const { examId } = request.body

  try {
    await prisma.exam.delete({
      where: { id: examId },
    })

    response.json({ success: true, message: 'Exam deleted successfully' })
  } catch (error) {
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

const sendNotificationToUser = async (request, response) => {
  const { title, body } = request.body

  const token =
    'e500Qqk3Q5-Sa4a6j1WSRe:APA91bFm3ROGWoI3gog_PkrJEEnuEmTqOpnTHkOGoOOOYJdJslW6H2aVQuv--FkHhTOtE7sWyM3AhgduriIaxPkPiO8scYx7sw3Elm7zRAcuiV6fFnm3D9g'

  try {
    await sendNotification(token, title, body)

    response.status(200).json({ success: 'Notification sent' })
  } catch (error) {
    console.log(error)
    response
      .status(500)
      .json({ success: false, error: 'Something went wrong, try again later' })
  }
}

module.exports = {
  createExam,
  submitExamAttempt,
  challengeUser,
  acceptChallenge,
  rejectChallenge,
  deleteExam,
  sendNotificationToUser,
}
