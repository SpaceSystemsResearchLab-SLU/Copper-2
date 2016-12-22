#################################################################
#                     Raspberry Pi Main Script
#                     ------------------------
# N.Mercadante
# 12/21/2016
#
# Description:
# ------------
#
#
#
#################################################################


import serial
import binascii
from time import sleep

# Flat Files:
from getHeader import *



gpio = serial.Serial('/dev/ttyAMA0', 500000, timeout = None)
msg = ''

# Should have more functions in that flat-file
HEADER = getHeader()

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
          gpio.write(HEADER + 'TAKING_PI_IMG')
            
          # Run the Pi Picture Script
          execfile('take_pi_picture.py')

          # Alert when the picture has been taken
          gpio.write(HEADER + 'PI_IMAGE_TAKEN')


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

























      









