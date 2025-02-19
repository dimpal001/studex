const express = require('express')
const router = express.Router()

router.get('/protected-route', authenticateUser, async (request, response) => {
  return response.status(200).json({
    message: 'You have access to this protected route!',
    user: request.user,
  })
})

module.exports = router
