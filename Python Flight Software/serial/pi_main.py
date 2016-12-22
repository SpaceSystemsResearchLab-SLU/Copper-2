#################################################################
#                     Raspberry Pi Main Script
#                     ------------------------
# N.Mercadante
# 12/21/2016
#
# Description:
# ------------
# This will serve as the main script that will run on the Copper-2
# raspberry pi. It will monitor the PIC for commands and be able to
# use the pi camera and Quark IR camera. It will also run ARES.
#
#################################################################


import serial
import binascii
from time import sleep
from pi_sub_functions import *

# Flat Files:
from flat_file_getandsend import *



gpio = serial.Serial('/dev/ttyAMA0', 500000, timeout = None)
msg = ''

# Should have more functions in that flat-file
HEADER = getHeader()
PI_IMG_CTR = getPiIMGCount()


# ------------------- COMMANDS -----------------------------------
PI_PICTURE     = 'TAKEPIIMAGE'
QUARK_PICTURE  = 'TAKEQIMAGE'
SEND_PI_IMG    = 'SENDPIIMG'
SEND_QUARK_IMG = 'SENDQIMG'
ARES_ON        = 'ARESON'
ARES_OFF       = 'ARESOFF'
PI_SHUTDOWN    = 'PISHUTDOWN'


HANDSHAKE      = 'ROGERTHAT'

# -----------------------------------------------------------------


####################################################################
# Some extra helper functions here. These incoporate the serial 
# protocol that we have defined for Pi-PIC communication.


def check_for_confirmation(gpio_line, handshake):
  time_max = 20000  # 20 seconds
  time_ctr = 0;

  while time_ctr < time_max:
    while gpio_line.inWaiting():
      response = gpio_line.read()
      if response == handshake:
        return True
      else:
        sleep(0.001)
        time_ctr += 1
  return False

# -------------------------------------------------------------------

def write_to_pic(gpio_line, MESSAGE):
  while not gpio_line.inWaiting():           # While the UART buffer is empty, 
    gpio_line.write( '11'.decode('hex'))     # send the RTS byte.
    sleep(0.01)
  while gpio_line.inWaiting():               # When there is something in the UART
    response = gpio_line.read()              # buffer, check to see if it is the 
    if response == '11'.decode('hex') : # CTS byte.
      gpio_line.send(MESSAGE)
      
      if not check_for_confirmation(gpio_line, HANDSHAKE):   # intentionally
        break # TIMEOUT. Needs to be error handling here.    # hard-coded

#######################################################################



while True:
  try:
    while not gpio.inWaiting():
      sleep(0.5)

    while gpio.inWaiting():
      header = gpio.read(3)
      
      if header == HEADER:
        msg = gpio.read()
        
        if msg == PI_PICTURE:            
          # Respond to the PIC:
          write_to_pic(gpio, HEADER + 'TAKING_PI_IMG')
            
          # Run the Pi Picture Function
          take_pi_picture('pi_img_' + str(PI_IMG_CTR) + '.jpg')
          incrementPiIMGCount()

          # Alert when the picture has been taken - 
          # Send ACK w/ current number of Images in directory
          write_to_pic(gpio, HEADER + 'PI_IMAGE_TAKEN_' + str(PI_IMG_CTR))


        elif msg == QUARK_PICTURE:
          True

        elif msg == SEND_PI_IMG:
           True

        elif msg == SEND_QUARK_IMG:
           True

        elif msg == ARES_ON:
           True

        elif msg == ARES_OFF:
           True

        elif msg == PI_SHUTDOWN:
          #os.system('./shutdown_pi.sh')
          True

        else:
          gpio.write(HEADER + 'CMD_NOT_VALID')

  except:
    gpio.flush()
    gpio.close()
    break

























      









