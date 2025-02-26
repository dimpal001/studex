const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const authRoutes = require('./routes/authRoutes')
const questionRoutes = require('./routes/questionRoutes')
const userRoutes = require('./routes/userRoutes')
const examRoutes = require('./routes/examRoutes')
const friendRoutes = require('./routes/friendRoutes')
const classRoutes = require('./routes/classRoutes')
const subjectRoutes = require('./routes/subjectRoutes')

const app = express()

app.use(cors())
app.use(bodyParser.json())

app.use('/api/auth', authRoutes)
app.use('/api/question', questionRoutes)
app.use('/api/user', userRoutes)
app.use('/api/exam', examRoutes)
app.use('/api/class', classRoutes)
app.use('/api/subject', subjectRoutes)
app.use('/api/friend', friendRoutes)

module.exports = app
