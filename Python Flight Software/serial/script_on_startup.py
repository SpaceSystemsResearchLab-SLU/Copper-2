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
from picamera import *
from time import sleep
from datetime import *

MESSAGE_TO_PIC = '$$$0BPIPOWEREDON'
MESSAGE_FROM_PIC = 'ROGERTHAT'
TAKE_PIC_PI = "TAKEPICPI"
PI_OFF = "PIOFF"

MESSAGE_HEADER = '$$$'

pic_pi_comm_valid = False

#gpio = serial.Serial('/dev/ttyAMA0', 1000000, timeout = 0)
gpio = serial.Serial('/dev/ttyAMA0', 38400, timeout = 0)
PIC_response = False

# Loop until the PIC responds to the message
while not PIC_response:

    # There is no response in the UART line
    while not gpio.inWaiting() and not PIC_response:
        gpio.write( MESSAGE_TO_PIC )     # Write message to PIC
        #DEBUG
        print 'in waiting... ' + str(PIC_response)
        sleep(0.75)

    # There is a response in the UART line
    while gpio.inWaiting() and not PIC_response:    
        print '------------------'
	gpio.write( MESSAGE_TO_PIC )     # Write message to PIC
	sleep(0.75)	

        # Parse message
        
	PIC_message = gpio.read(gpio.inWaiting())
        header = PIC_message[0:3]
        msg_length = int(PIC_message[3:5], 16)
        
        if (isinstance(msg_length,(int,long))):
            msg_length = int(msg_length)
            print str(msg_length)
        else:
            break

        message = str(PIC_message[5:5+msg_length+0])

        #DEBUG
        print 'not in waiting...'
	#print 'ascii header + message: ' + header + message
        #print header
	print message 
	print len(message)
        #print MESSAGE_FROM_PIC
	#print len(MESSAGE_FROM_PIC)
        #print message == str(MESSAGE_FROM_PIC)

        if ((header == MESSAGE_HEADER)):
            if message == MESSAGE_FROM_PIC: # PIC confirms connection
                #PIC_response = True
                #DEBUG
                print 'Got it! Connection Confirmed.'
                pic_pi_comm_valid = True
            if pic_pi_comm_valid and message == TAKE_PIC_PI:
                # take Pi Picture
                cam = PiCamera()
                fn = '{:%m-%d-%Y_%H:%M:%S}'.format(datetime.now()) + '.jpg' 
                cam.capture(fn)
                print 'picture confirm'
                PIC_response = True
                break


    if PIC_response:
        break

gpio.close()
