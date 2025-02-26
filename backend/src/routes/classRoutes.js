const express = require('express')
const { getClasses } = require('../controllers/classController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.get('/get-classes', getClasses)
module.exports = router
