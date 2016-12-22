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

