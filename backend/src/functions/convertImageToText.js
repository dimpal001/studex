const { spawn } = require('child_process')
const path = require('path')
const fs = require('fs')

const convertImageToText = (imagePath) => {
  return new Promise((resolve, reject) => {
    if (!fs.existsSync(imagePath)) {
      return reject('Image file does not exist.')
    }

    const pythonProcess = spawn('python3', [
      path.join(__dirname, 'ocr.py'),
      imagePath,
    ])

    let extractedText = ''

    pythonProcess.stdout.on('data', (data) => {
      extractedText += data.toString()
    })

    pythonProcess.stderr.on('data', (data) => {
      console.error(`Python Error: ${data}`)
    })

    pythonProcess.on('close', (code) => {
      if (code === 0) {
        resolve(extractedText.trim())
      } else {
        reject('Failed to extract text.')
      }
    })
  })
}

module.exports = convertImageToText
