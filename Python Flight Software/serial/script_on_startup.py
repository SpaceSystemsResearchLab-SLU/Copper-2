########################################################
#                   Pi Startup Script
#                   -----------------
# N.Mercadante
# 12/20/2016
#
# Description:
# ------------
# The purpose of this script is to allow the PIC and Pi
# to do a quick handshake upon power on. Then, the Pi is
# free to continue it's job.
#
########################################################

import serial
import binascii
from time import sleep

MESSAGE_TO_PIC = '$$$PIPOWEREDON'
MESSAGE_FROM_PIC = 'ROGERTHAT'
MESSAGE_HEADER = '$$$'


gpio = serial.Serial('/dev/ttyAMA0', 1000000, timeout = 0)
PIC_response = False

# Loop until the PIC responds to the message
while not PIC_response:

    # There is no response in the UART line
    while not gpio.inWaiting():
        gpio.write( MESSAGE_TO_PIC )     # Write message to PIC
        #DEBUG
        print 'in waiting...'
        sleep(0.5)
    

    # There is a response in the UART line
    while gpio.inWaiting():    
        gpio.write( MESSAGE_TO_PIC )     # Write message to PIC
	sleep(0.5)	

        # Parse message
        header = gpio.read(3)
        PIC_message = gpio.read(gpio.inWaiting())
       # num_bytes = PIC_message[1]

        #DEBUG
        print 'not in waiting...'
	print 'ascii header: ' + header
	print 'ascii message: ' + PIC_message	
	

        if header == MESSAGE_HEADER:
            
            if PIC_message == MESSAGE_FROM_PIC : # PIC confirms connection
                PIC_response = True
                #DEBUG
                print 'Got it! Connection Confirmed.'


gpio.close()


