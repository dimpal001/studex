const express = require('express')
const {
  createExam,
  fetchUpcomingExams,
  fetchPastExams,
  fetchSingleExam,
  fetchExamData,
} = require('../controllers/examController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.post('/create-exam', mobileAuthenticateUser, createExam)
router.get('/get-upcoming-exams', mobileAuthenticateUser, fetchUpcomingExams)
router.get('/get-past-exams', fetchPastExams)
router.get('/get-single-exam', mobileAuthenticateUser, fetchSingleExam)
router.get('/get-detail-exam-data', mobileAuthenticateUser, fetchExamData)

module.exports = router
