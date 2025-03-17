const express = require('express')
const {
  askQuestion,
  moveToAnotherChapter,
  getLatestQuestion,
  getDetailQuestion,
  getSubjectWiseQuestion,
} = require('../controllers/questionController')

const router = express.Router()

const multer = require('multer')
const upload = multer({ dest: 'uploads/' })

router.get('/latest-questions', getLatestQuestion)
router.get('/detail-question', getDetailQuestion)
router.get('/question-by-subject', getSubjectWiseQuestion)
router.post('/ask', upload.single('image'), askQuestion)
router.post('/move-to-another-chapter', moveToAnotherChapter)

module.exports = router
