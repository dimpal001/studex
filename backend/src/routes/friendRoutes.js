const express = require('express')
const {
  searchUser,
  sendFriendRequest,
  respondFriendRequest,
  unfriend,
  friendList,
} = require('../controllers/friendsController')
const mobileAuthenticateUser = require('../middlewares/mobileAuthenticateUser')

const router = express.Router()

router.get('/search-user', searchUser)
router.post('/send-request', mobileAuthenticateUser, sendFriendRequest)
router.post('/response-request', mobileAuthenticateUser, respondFriendRequest)
router.post('/unfriend', mobileAuthenticateUser, unfriend)
router.get('/friend-list', mobileAuthenticateUser, friendList)

module.exports = router
