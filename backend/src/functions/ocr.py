import sys
import pytesseract
import cv2

def handwritten_to_text(image_path):
    img = cv2.imread(image_path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    text = pytesseract.image_to_string(gray, config='--psm 6')
    return text

if __name__ == "__main__":
    image_path = sys.argv[1]
    print(handwritten_to_text(image_path))
