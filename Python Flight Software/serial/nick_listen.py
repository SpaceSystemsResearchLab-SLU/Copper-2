import serial
import binascii
from time import sleep

count = 0
#gpio = serial.Serial('/dev/ttyAMA0', 1000000, timeout = 0)
gpio = serial.Serial('/dev/ttyAMA0', 500000, timeout = None)
msg = ""

while True:
  try:   
    while not gpio.inWaiting():
      sleep(0.5)
      True

    while gpio.inWaiting():
      char = gpio.read(3)		# Header
      #char = '$$$'
      msg = gpio.read(gpio.inWaiting()) 
      
      
#      if char == '$$$':
#       pic_command = msg
#	print 'pic_command_ascii: ', pic_command        
# 
#        if pic_command == "$$$ROGERTHAT":
#          print 'I got the message'
    
      print 'PIC msg (raw): ', msg
      print 'PIC char(raw): ', char
      print 'Counter:       ', str(count)
      count += 1

#      print 'PIC MSG (hex): ', binascii.b2a_hex(msg)
      
      gpio.flush()
      print 'I flushed the GPIO'

  except(KeyboardInterrupt):
    gpio.flush()
    print 'I flushed the GPIO'
    gpio.close()
    print 'I closed the GPIO'
    break
