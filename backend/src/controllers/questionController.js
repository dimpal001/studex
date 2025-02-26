const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const askQuestion = async (request, response) => {
  try {
    const {
      userId,
      question,
      subjectData = null,
      classData = null,
      marks = null,
      language = null,
    } = request.body.data

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

    const data = {
      question: `What is force?`,
      answer: `# **Integration in Mathematics**

## **1. Introduction**
Integration is a fundamental concept in calculus that represents the process of finding the **integral** of a function. It is the reverse process of differentiation and is used to calculate areas, volumes, displacement, and many other physical quantities.

---

## **2. Types of Integration**
There are two main types of integrals:

### **a. Indefinite Integral**
- An **indefinite integral** represents a family of functions and includes a constant of integration **C**.
- It is written as:

  \[
  \int f(x) \,dx = F(x) + C
  \]

  where \( F(x) \) is the **antiderivative** of \( f(x) \).

### **b. Definite Integral**
- A **definite integral** calculates the exact area under the curve between two limits \( a \) and \( b \).
- It is written as:

  \[
  \int_{a}^{b} f(x) \,dx = F(b) - F(a)
  \]

  where \( F(x) \) is the antiderivative of \( f(x) \).

---

## **3. Basic Integration Rules**
Here are some common integration formulas:

| Function \( f(x) \) | Integral \( \int f(x) \,dx \) |
|---------------------|--------------------------------|
| \( x^n \) (where \( n \neq -1 \)) | \( \frac{x^{n+1}}{n+1} + C \) |
| \( e^x \) | \( e^x + C \) |
| \( \sin x \) | \( -\cos x + C \) |
| \( \cos x \) | \( \sin x + C \) |
| \( \frac{1}{x} \) | \( \ln |x| + C \) |

---

## **4. Applications of Integration**
Integration is widely used in various fields, including:

- **Physics**: Finding displacement, velocity, and acceleration.
- **Engineering**: Calculating areas, volumes, and work done by a force.
- **Economics**: Computing total cost, revenue, and profit.
- **Biology**: Modeling population growth and decay.
- **Statistics**: Probability distributions and expected values.

---

## **5. Example Problems**
### **Example 1: Indefinite Integral**
Find:

\[
\int (3x^2 + 5) \,dx
\]

**Solution:**
Using the power rule,

\[
\int 3x^2 \,dx = x^3, \quad \int 5 \,dx = 5x
\]

\[
\Rightarrow x^3 + 5x + C
\]

---

### **Example 2: Definite Integral**
Evaluate:

\[
\int_{1}^{3} (2x) \,dx
\]

**Solution:**
Finding the antiderivative:

\[
\int 2x \,dx = x^2
\]

Applying limits:

\[
[3^2 - 1^2] = [9 - 1] = 8
\]

**Final Answer:** \( 8 \)

---

## **6. Conclusion**
Integration is a powerful mathematical tool used in various disciplines. Mastering different integration techniques allows solving complex real-world problems efficiently.

---

## **7. Further Study**
To deepen your understanding, explore:
- **Integration by Parts**
- **Partial Fraction Decomposition**
- **Trigonometric Integrals**
- **Improper Integrals**
`,
    }

    const resData = data

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
    const { userId } = request.body.data

    if (!userId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const latestQuestions = await prisma.question.findMany({
      where: { userId },
      orderBy: { createdAt: 'desc' },
      take: 10,
      include: { answers: true, subject: true, chapter: true },
    })

    return response.status(200).json({ resData: latestQuestions })
  } catch (error) {
    console.error('Error:', error.message)
    return response.status(500).json({
      error: 'Failed fetching questions.',
    })
  }
}

const getSubjectWiseQuestion = async (request, response) => {
  try {
    const { userId, subjectId } = request.body.data

    if (!userId || !subjectId) {
      return response.status(400).json({ error: 'Missing required fields' })
    }

    const questions = await prisma.question.findMany({
      where: { userId, subjectId },
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

const getChapterWiseQuestion = async (request, response) => {
  try {
    const { userId, chapterId } = request.body.data

    if (!userId || !chapterId) {
      return response.status(400).json({ error: 'Missing required fields' })
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
  try {
    const { userId, query } = request.body.data

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

    const resData = {
      question,
      message: 'Question has been added',
    }

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
