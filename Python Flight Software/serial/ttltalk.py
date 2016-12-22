import serial
from time import sleep
#import random

def main():
  #baud = raw_input("baud? ")
  #gpio = serial.Serial("/dev/ttyAMA0", 1000000, timeout = None)
  gpio = serial.Serial("/dev/ttyAMA0", 500000, timeout = None)
  #mess = open("testFile.txt")
  #message = mess.read()
  
  count = 0


  #message = raw_input("serial out: ")
  #msg1 = "Hello_World!"
  msg2 = "$$$PIPOWEREDON"
  while True:
 
    #print("sent")
    #if message == "quit" or message == "q":
    #  break
    #print "Sending msg1..."
    #gpio.write(msg1)
    #gpio.flush()
    #print 'I flushed the GPIO'

    #sleep(1)
    print "Sending msg2..."
    gpio.write(msg2)
    gpio.flush()
    print 'I flushed the GPIO'
    
    print str(count)
    count += 1
    
#    randnum = random.randint(1,5)
    sleepnum = 0.5
    
    sleep(sleepnum)
    

main()
