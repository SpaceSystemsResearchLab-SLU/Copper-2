#Grabs the header from the 'HEADER' flat file

from sys import *

def getHeader():
  filename = 'HEADER'
  header = ''
  with open('HEADER') as f:
      header = f.read()
  return header.strip('\n')
