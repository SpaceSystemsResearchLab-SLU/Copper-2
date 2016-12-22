import serial
from binascii import *
from time import sleep
import random

#################### sendMessage() ################################
def sendMessage(gpio):
  HEADER = '$$$'
  ENDING = '~~~'
  MESSAGE = 'HI_DONNIE'
  
  gpio.write(HEADER + MESSAGE + ENDING)
  print 'Message sent: ' + HEADER + MESSAGE + ENDING

############################################################


######################## Main() ################################
def main():
  gpio = serial.Serial("/dev/ttyAMA0", 500000, timeout = None)
  
  #msg2 = '11'.decode('hex')
  msg2 = '$$$PIPOWEREDON~~~'

  while True:
    
    # while there's no response, keep ringing

    while not gpio.inWaiting():
      randnum = random.randint(1,5)
      sleepnum = randnum*0.01
      #sleepnum = 0.001  # seconds


      print "Sending msg2..."
      gpio.write(msg2)
      gpio.flush()
    
      print 'sending message (ascii): ' + msg2  
      #print 'Sending message (hex): ' + hexlify(msg2) 
    
          
      sleep(sleepnum)
    
    # If we get a response, check if it is correct

    while gpio.inWaiting():
      msg = gpio.read()
      if msg == '11'.decode('hex'):
        print 'I got it!'
        sendMessage(gpio)

############################################################


main()
