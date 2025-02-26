const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const addEducationData = async (request, response) => {
  const { id, classId, boardId, fullName } = request.body.data

  try {
    const user = await prisma.user.update({
      where: { id },
      data: {
        fullName,
        classId,
        boardId,
      },
    })

    const resData = { message: 'User data has been updated', user }

    return response.status(201).json({ resData })
  } catch (error) {
    console.log(error?.message)
    return response.status(500).json({
      error: 'User data updated failed.',
    })
  }
}

const addSubjects = async (request, response) => {
  const { userId, subjectIds } = request.body.data

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

    const resData = {
      message: 'Subjects added successfully',
      allSubjects,
    }

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error?.message)
    return response.status(500).json({ error: 'Failed to add subjects' })
  }
}

const addSingleSubject = async (request, response) => {
  const { userId, subjectId } = request.body.data

  try {
    const subject = await prisma.subject.findUnique({
      where: { id: subjectId },
    })
    if (!subject) {
      return response.status(404).json({ error: 'Subject not found' })
    }

    const existingUserSubject = await prisma.userSubject.findUnique({
      where: { userId_subjectId: { userId, subjectId } },
    })
    if (existingUserSubject) {
      return response
        .status(400)
        .json({ error: 'Subject already added to user' })
    }

    const newSubject = await prisma.userSubject.create({
      data: {
        userId,
        subjectId,
      },
    })

    const resData = {
      message: 'Subject added successfully',
      newSubject,
    }

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ error: 'Failed to add subject' })
  }
}

const removeSubjectFromUser = async (request, response) => {
  const { userId, subjectId } = request.body.data

  try {
    await prisma.userSubject.deleteMany({
      where: { userId, subjectId },
    })

    const resData = { message: 'Subject removed successfully' }

    return response.status(201).json({ resData })
  } catch (error) {
    console.error(error)
    return response.status(500).json({ error: 'Failed to remove subject' })
  }
}

const getSubjects = async (request, response) => {
  const { userId } = request.query
  try {
    const subjects = await prisma.userSubject.findMany({
      where: { userId },
      include: { subject: true },
    })

    return response.status(200).json({ resData: subjects })
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
