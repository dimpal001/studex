const express = require('express')
const {
  addEducationData,
  getSubjects,
} = require('../controllers/userController')

const router = express.Router()

router.post('/add-education-data', addEducationData)
router.get('/get-subjects', getSubjects)

module.exports = router
