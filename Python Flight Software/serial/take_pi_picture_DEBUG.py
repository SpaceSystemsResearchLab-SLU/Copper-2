import serial
import binascii
import picamera
from time import sleep
from getHeader import *


camera = picamera.PiCamera()
gpio = serial.Serial('/dev/ttyAMA0', 500000, timeout = None)
msg = ""

HEADER = getHeader()    # Should be '$$$'
IMG_FILENAME = 'pi_image.jpg'

while True:
  try:
    while not gpio.inWaiting():
      sleep(0.5)
      True
    
    while gpio.inWaiting():
      header = gpio.read(3)               # Header
      msg = gpio.read(gpio.inWaiting())
      
      if header == HEADER:
        pic_command = msg
        print 'pic_command_ascii: ', pic_command
        
        # Will need to change ROGERTHAT
        if pic_command == "ROGERTHAT":
          print 'I got the take pi picture command'
          camera.capture( IMG_FILENAME )
          print 'I took the picture and saved as ', IMG_FILENAME
          
          gpio.write(HEADER + 'PI IMAGE CAPTURED')
          
          
    gpio.flush()
    print 'I flushed the GPIO'
  
  except(KeyboardInterrupt):
    gpio.flush()
    print 'I flushed the GPIO'
    gpio.close()
    print 'I closed the GPIO'
    break

