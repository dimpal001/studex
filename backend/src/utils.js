const CryptoJS = require('crypto-js')
const crypto = require('crypto')
const OpenAI = require('openai')

const openai = new OpenAI({
  apiKey: process.env.GPT_ACCESS_KEY,
})

const askAi = async (content, model, maxTokens = 150, minTokens = 4) => {
  try {
    const stream = await openai.chat.completions.create({
      model: model ? model : 'gpt-4o-mini',
      messages: [{ role: 'user', content: content }],
      store: true,
      stream: true,
      max_tokens: maxTokens,
      min_tokens: minTokens,
    })

    let response = ''
    for await (const chunk of stream) {
      response += chunk.choices[0]?.delta?.content || ''
    }

    return response
  } catch (error) {
    console.log('Error:', error)
    throw new Error('Unable to generate response')
  }
}

const generateInstituteId = () => {
  const letters = Array.from({ length: 5 }, () =>
    String.fromCharCode(65 + Math.floor(Math.random() * 26))
  ).join('')
  const numbers = Math.floor(100 + Math.random() * 900)
  return `${letters}${numbers}`
}

const validateEmail = (email) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

const generateRandomToken = () => {
  return crypto.randomBytes(16).toString('hex')
}

const encryptData = (data) => {
  const secretKey = process.env.ENCRYPTION_KEY
  if (!secretKey) {
    throw new Error('Encryption key is missing.')
  }

  const key = CryptoJS.enc.Utf8.parse(
    secretKey.padEnd(32, '0').substring(0, 32)
  )

  const iv = CryptoJS.lib.WordArray.random(16)

  const encrypted = CryptoJS.AES.encrypt(JSON.stringify(data), key, {
    iv: iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  })

  const encryptedCombined = Buffer.concat([
    Buffer.from(iv.toString(CryptoJS.enc.Base64), 'base64'),
    Buffer.from(encrypted.ciphertext.toString(CryptoJS.enc.Base64), 'base64'),
  ]).toString('base64')

  return encryptedCombined
}

const decryptData = (encryptedData) => {
  const secretKey = process.env.ENCRYPTION_KEY
  if (!secretKey) {
    throw new Error('Encryption key is missing.')
  }

  console.log(encryptedData)

  try {
    const encryptedBytes = Buffer.from(encryptedData, 'base64')

    const iv = CryptoJS.lib.WordArray.create(encryptedBytes.slice(0, 16))

    const encryptedPayload = CryptoJS.lib.WordArray.create(
      encryptedBytes.slice(16)
    )

    const key = CryptoJS.enc.Utf8.parse(
      secretKey.padEnd(32, '0').substring(0, 32)
    )

    const decrypted = CryptoJS.AES.decrypt(
      { ciphertext: encryptedPayload },
      key,
      { iv: iv, mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7 }
    )

    return JSON.parse(decrypted.toString(CryptoJS.enc.Utf8))
  } catch (error) {
    console.log(error)
    throw new Error('Decryption failed. Invalid encrypted data.')
  }
}

module.exports = {
  askAi,
  generateInstituteId,
  validateEmail,
  generateRandomToken,
  encryptData,
  decryptData,
}
