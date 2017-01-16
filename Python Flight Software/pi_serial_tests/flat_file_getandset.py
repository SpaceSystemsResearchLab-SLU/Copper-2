# Intended to provide all getters and setters for the flat files
# on the Copper-2 raspberry pi.

from sys import *

# Generic Getters and Setters
def getInfo(FileName):
  info = ''
  with open(FileName) as f:
    info = f.read()
  return info.strip('\n')


def setInfo(FileName, info):
  f = open(FileName, 'w')
  f.write(info)
  f.close()

# Wrapper Functions

def getHeader():
  return getInfo('HEADER')


def getPiIMGCount():
  return getInfo('PI_IMG_COUNT')

def incrementPiIMGCount():
  curr = int( getPiIMGCount() )
  curr += 1
  setInfo('PI_IMG_COUNT', str(curr))

def getStatus():
  return getInfo('status')

def getStatus_bool():
  return bool(getInfo('status'))

def changeStatus():
  if getStatus() == '0':
    setStatus(1)
  elif getStatus() == '1':
    setStatus(0)
  else:
    print 'ERROR'

def setStatus(zero_or_one):
  setInfo('status', str(zero_or_one))


  #### for flight testing... ####

def getMessage():
  return getInfo('message')

def setMessage(message_var):
  setInfo('message', str(message_var))



def getSendPicResponse():
  return getInfo('send_pic_response')

def setSendPicResponse(sendpicresp):
  setInfo('send_pic_response', str(sendpicresp))




def getTakePicture():
  return getInfo('take_picture')

def setTakePicture(takepicturevar):
  setInfo('take_picture', str(takepicturevar))




























