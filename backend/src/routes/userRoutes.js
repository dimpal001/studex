const express = require('express')
const {
  addEducationData,
  getSubjects,
  getFriends,
} = require('../controllers/userController')

const router = express.Router()

router.post('/add-education-data', addEducationData)
router.get('/get-subjects', getSubjects)
router.get('/get-friends', getFriends)

module.exports = router
