import serial
from time import sleep
import sys
import os

def main():
  #rec = open("rec.txt", "w")  

  if len(sys.argv) != 2:
      print "Specify baud on command line!! ex: 921600 or 115200"
      return

  #gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), timeout=0.5)
  gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]))
  sleep(0.1)
  gpio.flushInput()
  gpio.flushOutput()

  #fil = open("test_send_at_1000000bps.jpg",'wb')
  fil = open("test_send_at_115200.jpg",'wb')
  #file_status = fil.closed
  #print file_status
  #got_file = False

  while True and (os.fstat(fil.fileno()).st_size !=1145056):
    while not gpio.inWaiting():
      sleep(0.5)

    while gpio.inWaiting():
      stuff =  gpio.read(gpio.inWaiting()) 
      #print stuff
      #fil.write(gpio.read(gpio.inWaiting())
      fil.write(stuff)
      fil.flush()
      if (os.fstat(fil.fileno()).st_size >= 1145056):
        break 
      sleep(0.001)
   
    #print len(stuff) 
     
  fil.flush()
  print os.fstat(fil.fileno()).st_size 
  fil.close()
  print fil.closed 
  gpio.close()

main()
