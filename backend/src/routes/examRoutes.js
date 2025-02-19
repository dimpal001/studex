const express = require('express')
const {
  createExam,
  sendNotificationToUser,
} = require('../controllers/examController')

const router = express.Router()

router.post('/create-exam', createExam)
router.post('/send-notification', sendNotificationToUser)

module.exports = router
