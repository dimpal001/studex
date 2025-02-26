const express = require('express')
const {
  signUp,
  verifyOtp,
  createUser,
  updateUserData,
  login,
  forceLogin,
} = require('../controllers/authController')

const router = express.Router()

router.post('/signup', signUp)
router.post('/verify-otp', verifyOtp)
router.post('/set-password', createUser)
router.post('/update-user-data', updateUserData)
router.post('/login', login)
router.post('/force-login', forceLogin)

module.exports = router
