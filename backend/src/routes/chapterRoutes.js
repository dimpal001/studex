const express = require('express')
const {
  getChapters,
  addChapter,
  updatedChapter,
  deleteChapter,
} = require('../controllers/chapterController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.get('/get-chapters', getChapters)
router.post('/add-chapter', addChapter)
router.patch('/update-chapter', updatedChapter)
router.delete('/delete-chapter', deleteChapter)
module.exports = router
