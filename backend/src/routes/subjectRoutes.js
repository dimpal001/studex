const express = require('express')
const { getSubjects } = require('../controllers/subjectController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.get('/get-subjects', getSubjects)
module.exports = router
