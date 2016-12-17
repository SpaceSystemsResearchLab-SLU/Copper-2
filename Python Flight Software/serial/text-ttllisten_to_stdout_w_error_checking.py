import serial
from time import sleep
import sys
import os
import binascii

def main():
  #rec = open("rec.txt", "w")  

  if len(sys.argv) != 2:
      print "Specify baud on command line!! ex: 921600 or 115200"
      return

  gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), timeout=None)
  #gpio = serial.Serial("/dev/ttyUSB2", int(sys.argv[1]))
  gpio.close()
  sleep(0.1)
  gpio.open()
  sleep(0.1)
  gpio.flushInput()
  gpio.flushOutput()

  #fil = open("test_send_at_1000000bps.jpg",'w')
  sleep(0.1)
  #file_status = fil.closed
  #print file_status
  #got_file = False
  receive = True
  bad_count = 0
  count = 0
  to_send = 'U'

  while receive:
    while not gpio.inWaiting():
      sleep(0.5)

    while gpio.inWaiting():
      stuff =  gpio.read(gpio.inWaiting()) 
      #print type(stuff)
      if to_send not in stuff:
        bad_count += 1 
        print bad_count
      count += 1
      if ((count % 1000) == 0):
        print count
      #print binascii.b2a_hex(stuff) + "   " + str(len(stuff)) + "\r\n"
      #print stuff
      #rec.write(stuff)
      #rec.flush()
      #fil.write(gpio.read(gpio.inWaiting())
      #fil.write(stuff)
      #fil.flush()
      #if (os.fstat(rec.fileno()).st_size >= 44):
      #  receive = False
      #  break 
      if (count == 100000):
        receive = False
        break
      sleep(0.0001)
    
  print "Bad count = " + str(bad_count)
  print "Total count = " + str(count)
  print "% Error = " + str(100.0*(bad_count/count)) 
    #print len(stuff) 
     
    #rec.flush()
    #print "Received file size: " + str(os.fstat(rec.fileno()).st_size) 

  #rec.close()
  #print rec.closed 
  gpio.close()

main()
