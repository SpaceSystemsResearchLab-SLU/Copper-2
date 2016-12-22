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
  #to_send = 'U'
  to_send = '\x0b\x93'
  start_time = 0

  while receive:
  #  while not gpio.inWaiting():
  #    sleep(0.5)

    while gpio.inWaiting():
      if not start_time:
        start_time = time.time()
        print "Receiving something..."

      stuff =  gpio.read(gpio.inWaiting()) 
      #print stuff + " " + str(len(stuff))
      if to_send not in stuff:
        bad_count += 1 
        print bad_count
      count += len(stuff)
      if ((count % 1000) == 0):
        print count
      print binascii.b2a_hex(stuff) + "   " + str(len(stuff)) + "\r\n"
      #print stuff
      #rec.write(stuff)
      #rec.flush()
      #fil.write(gpio.read(gpio.inWaiting())
      #fil.write(stuff)
      #fil.flush()
      #if (os.fstat(rec.fileno()).st_size >= 44):
      #  receive = False
      #  break 
      if (count >= 143132):
        receive = False
        break
      #sleep(0.0001)
    
  end_time = time.time() - start_time
  print "Elapsed time (sec): " + str(end_time)
  print "Bad count = " + str(bad_count)
  print "Total count = " + str(count) + " Total Bytes = " + str(count*8)
  print "% Error = " + str(100.0*(bad_count/count)) 
    #print len(stuff) 
     
    #rec.flush()
    #print "Received file size: " + str(os.fstat(rec.fileno()).st_size) 

  #fil.close()
  #print rec.closed 
  gpio.close()

try:
  main()
except KeyboardInterrupt:
  pass
