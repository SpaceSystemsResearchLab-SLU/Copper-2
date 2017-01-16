from multiprocessing import *
from flat_file_getandset import *
from time import sleep
import sys
import os


def listen():
  while True:
    if getMessage() == 'pics':
      setTakePicture(1)

def talk():
  while True:
    if getSendPicResponse() == '1':
      print 'Sending message!'
      setSendPicResponse(0)

def printState():
  while True:
    print 'Message: ' + getMessage()
    print 'take_picture: ' + getTakePicture()
    print 'send_pic_response: ' + getSendPicResponse()
    print '-------------------'
    sleep(1)

def cameraMonitor():
  while True:
    if getTakePicture() == '1':
      print 'Taking Picture!'
      setTakePicture(0)
      setMessage("")
      setSendPicResponse(1)

def setState(newstdin):
  while True:
    sys.stdin = newstdin
    answer = raw_input('Message[n to not change]: ')
    if answer.lower().strip() != 'n':
      setMessage(str(answer))

if __name__ == '__main__':
  job1 = Process(target=talk).start()
  job2 = Process(target=listen).start()
  job3 = Process(target=printState).start()
  job4 = Process(target=cameraMonitor).start()
  newstdin = os.fdopen(os.dup(sys.stdin.fileno()))
  job5 = Process(target=setState, args=(newstdin,)).start()
