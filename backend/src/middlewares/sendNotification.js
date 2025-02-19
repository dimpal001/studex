const admin = require('firebase-admin')

if (!admin.apps.length) {
  const serviceAccount = require('../config/serviceAccountKey.json')
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
  })
}

const sendNotification = async (fcmToken, title, body) => {
  if (!fcmToken) {
    console.log('No FCM token provided.')
    return
  }

  const message = {
    notification: { title, body },
    token: fcmToken,
  }

  try {
    await admin.messaging().send(message)
    console.log(`Notification sent: ${title}`)
  } catch (error) {
    console.error('Error sending notification:', error)
  }
}

module.exports = { sendNotification }
