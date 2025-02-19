const { PrismaClient } = require('@prisma/client')
const { decryptData, encryptData } = require('../utils')

const prisma = new PrismaClient()

const addEducationData = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { id, classId, boardId, fullName } = decryptedData

  try {
    const user = await prisma.user.update({
      where: { id },
      data: {
        fullName,
        classId,
        boardId,
      },
    })

    const resData = encryptData({ message: 'User data has been updated', user })

    return response.status(201).json({ resData })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'User data updated failed.',
    })
  }
}

const addSubjects = async (request, response) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { userId, subjectIds } = decryptedData

  try {
    if (!userId || !Array.isArray(subjectIds) || subjectIds.length === 0) {
      return response
        .status(400)
        .json({ error: 'User ID and subject IDs are required' })
    }

    const subjects = await prisma.subject.findMany({
      where: { id: { in: subjectIds } },
    })

    if (subjects.length !== subjectIds.length) {
      return response
        .status(400)
        .json({ error: 'Some subject IDs are invalid' })
    }

    const userSubjects = subjectIds.map((subjectId) => ({
      userId,
      subjectId,
    }))

    await prisma.userSubject.createMany({
      data: userSubjects,
      skipDuplicates: true,
    })

    const allSubjects = await prisma.user.findUnique({
      where: { id: userId },
      select: { subjects: true },
    })

    const resData = encryptData({
      message: 'Subjects added successfully',
      allSubjects,
    })

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error?.message)
    return response.status(500).json({ error: 'Failed to add subjects' })
  }
}

const addSingleSubject = async (req, res) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { userId, subjectId } = decryptedData

  try {
    const subject = await prisma.subject.findUnique({
      where: { id: subjectId },
    })
    if (!subject) {
      return res.status(404).json({ error: 'Subject not found' })
    }

    const existingUserSubject = await prisma.userSubject.findUnique({
      where: { userId_subjectId: { userId, subjectId } },
    })
    if (existingUserSubject) {
      return res.status(400).json({ error: 'Subject already added to user' })
    }

    const newSubject = await prisma.userSubject.create({
      data: {
        userId,
        subjectId,
      },
    })

    const resData = encryptData({
      message: 'Subject added successfully',
      newSubject,
    })

    return res.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ error: 'Failed to add subject' })
  }
}

const removeSubjectFromUser = async (req, res) => {
  const { data } = request.body
  const decryptedData = decryptData(data)

  if (!decryptedData) {
    return response.status(400).json({ message: 'Data format is invalid' })
  }

  const { userId, subjectId } = decryptedData

  try {
    await prisma.userSubject.deleteMany({
      where: { userId, subjectId },
    })

    const resData = encryptData({ message: 'Subject removed successfully' })

    return res.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ error: 'Failed to remove subject' })
  }
}

const getSubjects = async (request, response) => {
  const { data } = await request.query
  if (!data) {
    return response.status(400).json({ message: 'Missing data in query' })
  }
  const decryptedData = decryptData(data)
  try {
    if (!decryptedData) {
      return response.status(400).json({ message: 'Data format is invalid' })
    }

    const { userId } = decryptedData
    console.log(decryptedData)

    const subjects = await prisma.userSubject.findMany({
      where: { userId },
      include: { subject: true },
    })

    console.log(subjects)

    const resData = encryptData({ subjects })

    return response.status(200).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Failed to retrieve subjects' })
  }
}

module.exports = {
  addEducationData,
  addSubjects,
  addSingleSubject,
  removeSubjectFromUser,
  getSubjects,
}
