import serial
import binascii
from time import sleep


gpio = serial.Serial('/dev/ttyAMA0', 1000000, timeout = 0)

while True:
  try:   
    while not gpio.inWaiting():
      sleep(0.5)


    while gpio.inWaiting():
      char = gpio.read(3)

      # '$$$' is the signifier for the command from the
      # PIC to the Pi. Was '~' before Nick messed with it.
      if char == '$$$':
        pic_command = gpio.read(gpio.inWaiting())
#        print 'pic_command: ', binascii.b2a_hex(pic_command)
	print 'pic_command_ascii: ', pic_command[1:]
        
        # ---------------------------------------------
        # Need to do something with the number of bytes
        # in the command, the layout is below:
        #           "$$$Ncccccccccc"
        # Where N is the number of bytes and cc...c is 
        # the command.
        # ---------------------------------------------
        
        if pic_command[1:] == "PITAKEIMG":
          print 'I got the message!!'

  except(KeyboardInterrupt):
    gpio.close()
    break
