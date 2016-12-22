# Simple script to take a pi picture.


import picamera

FILENAME = 'pi_img.jpg'     # Should include numbering system...
camera = picamera.PiCamera()

camera.capture(FILENAME)
print 'Picture Captured. Saved as: ' + FILENAME
