const express = require('express')
const {
  getQuestionPapers,
  generateQuestionPaper,
} = require('../controllers/questionPaperController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.get('/get-question-papers', getQuestionPapers)
router.post('/generate-question-paper', generateQuestionPaper)
module.exports = router
