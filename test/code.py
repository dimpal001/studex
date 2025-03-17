import pytesseract
import cv2

def handwritten_to_text(image_path):
    img = cv2.imread(image_path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    text = pytesseract.image_to_string(gray, config='--psm 6')
    return text

image_path = "./image.jpeg"  # Replace with your image path
extracted_text = handwritten_to_text(image_path)
print("Extracted Text:\n", extracted_text)

