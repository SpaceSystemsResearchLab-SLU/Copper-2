import serial
from time import sleep
import sys

def main():
  #rec = open("rec.txt", "w")  

  if len(sys.argv) != 2:
      print "Specify baud on command line!! ex: 921600 or 115200"
    return

  #gpio = serial.Serial("/dev/ttyAMA0", int(sys.argv[1]))
  gpio = serial.Serial("/dev/ttyUSB2", int(sys.argv[1]))

  while True:
    if gpio.inWaiting():
      print gpio.read(gpio.inWaiting())
      #rec.write(gpio.read(gpio.inWaiting()))
      #rec.flush()
      #rec.close()
#      rec.write("\n")
#      message = gpio.read(gpio.inWaiting)
 #     gpio.write(message)
      sleep(0.1)
    else:
      sleep(0.5)

main()
