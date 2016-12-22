from time import sleep
import serial
import sys
import os

#### set baud rate of UART at HW level 1st!!  ####
#### Use: sudo stty -F /dev/ttyAMA0 921600    #### 

def send_text_to_PIC():

  if len(sys.argv) != 2:
    print "Specify baud on command line! ex: 921600 or 115200"
    return

  #test_string = "The quick brown fox jumps over the lazy dog!"
  #f = open('phrase1.txt','rb')
  #for c in f:
  #  print c
  #print "File size: " + str(os.fstat(f.fileno()).st_size)
  #to_send = f.read()
  #to_send = 'U' 
  #to_send = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" 
  to_send = '\x0B\x93'
  gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]), write_timeout=None)  

  while True:
    gpio.write(to_send)
    #sleep(0.01)

  #byteswritten = gpio.write(to_send)
  #print "Bytes written: " + str(byteswritten)
  #f.close()
  gpio.close()
 
send_text_to_PIC()
