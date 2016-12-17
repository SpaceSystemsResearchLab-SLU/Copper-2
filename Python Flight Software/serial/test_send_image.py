import time
import serial
import sys
import os

#### set baud rate of UART at HW level 1st!!  ####
#### Use: sudo stty -F /dev/ttyAMA0 921600    #### 

def send_image_to_PIC():

  if len(sys.argv) != 2:
    print "Specify baud on command line! ex: 921600 or 115200"
    return

  f = open('test.jpg','rb')
  #print os.fstat(f.fileno()).st_size
  pic = f.read()
  #gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), write_timeout=0)  
  #gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), write_timeout=None)  
  gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]))  
  #gpio.write('gobbledygook')
  start_time = time.time()
  #print gpio.write(pic)
  #byteswritten = len(pic)
  byteswritten = gpio.write(pic)
  end_time = time.time() - start_time
  print byteswritten
  print "Total time (sec): " + str(end_time)
  f.close()
  gpio.close()
 
send_image_to_PIC()
