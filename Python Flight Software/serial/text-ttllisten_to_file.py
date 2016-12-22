import serial
import time
from time import sleep
import sys
import os
import binascii

def main():
  #rec = open("rec.txt", "w")  

  if len(sys.argv) != 2:
      print "Specify baud on command line!! ex: 921600 or 115200"
      return

  gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), timeout=0)
  #gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), timeout=None)
  #gpio = serial.Serial("/dev/ttyUSB2", int(sys.argv[1]))
  gpio.flushInput()
  gpio.flushOutput()
  sleep(0.01)

  fil = open("test_send_at_115200.jpg",'wb')
  #file_status = fil.closed
  #print file_status
  #got_file = False
  receive = True
  start_time = 0

  while receive:
    while not gpio.inWaiting():
      sleep(0.5)
   
    while gpio.inWaiting():
      if not start_time:
        start_time = time.time()
        print "Receiving something..."

      stuff =  gpio.read(gpio.inWaiting()) 
      #print type(stuff)
      #rec.write(stuff)
      #rec.flush()
      #print binascii.b2a_hex(stuff) + "   " + str(len(stuff)) + "\r\n"
      #fil.write(gpio.read(gpio.inWaiting())
      fil.write(stuff)
      fil.flush()
      if (os.fstat(fil.fileno()).st_size >= 1145056):
        receive = False
        print "Received file size: " + str(os.fstat(fil.fileno()).st_size) 
        break 
      #sleep(0.001)
     
    #print len(stuff) 
     

  fil.close()
  print fil.closed 
  gpio.close()

main()
