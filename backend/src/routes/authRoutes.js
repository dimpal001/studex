const express = require('express')
const {
  signUp,
  verifyOtp,
  createUser,
  login,
  forceLogin,
} = require('../controllers/authController')

const router = express.Router()

router.post('/signup', signUp)
router.post('/verify-otp', verifyOtp)
router.post('/create-user', createUser)
router.post('/login', login)
router.post('/force-login', forceLogin)

module.exports = router
