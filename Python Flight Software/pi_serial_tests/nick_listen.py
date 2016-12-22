import serial
from binascii import *
from time import sleep

count = 0
#gpio = serial.Serial('/dev/ttyAMA0', 1000000, timeout = 0)
gpio = serial.Serial('/dev/ttyAMA0', 500000, timeout = 0)
msg = ""

while True:
  try:   
    while not gpio.inWaiting():
      sleep(0.01)
      True

    while gpio.inWaiting():
      #char = gpio.read(3)		# Header
      #char = '$$$'
      msg = gpio.read(gpio.inWaiting()) 
      
      
      #print 'PIC msg (raw): ', msg
      
      print 'PIC msg(ascii): ', msg
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
