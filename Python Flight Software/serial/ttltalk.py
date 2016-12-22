import serial
from time import sleep

def main():
  baud = raw_input("baud? ")
  gpio = serial.Serial("/dev/ttyUSB1", baud)
  #mess = open("testFile.txt")
  #message = mess.read()

  while True:
    message = raw_input("serial out: ")
    #print("sent")
    if message == "quit" or message == "q":
      break
    print gpio.write(message)
    sleep(0.1)

main()
