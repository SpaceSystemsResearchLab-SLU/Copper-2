from multiprocessing import *
from time import sleep

def listen():
  while True:
    if message == 'pics':
      take_picture = True


def talk():
  while True:
    if send_pic_response == True:
      print 'Sending message!'
      send_pic_response = False

def printState():
  while True:
    print 'Message: ' + message
    print 'take_picture: ' + str(take_picture)
    print 'send_pic_response: ' + str(send_pic_response)
    print '-------------------'
    sleep(1)

def cameraMonitor():
  while True:
    if take_picture == True:
      print 'Taking Picture!'
      take_picture = False
      message = ""
      send_pic_response = True

def setState():
  while True:
    answer = raw_input('Message[n to not change]: ')
    if answer.lower().strip() != 'n':
      message = answer

if __name__ == '__main__':
  # Global variables:
  take_picture = False
  send_pic_response = False
  message = "pics"

  job1 = Process(target=talk).start()
  job2 = Process(target=listen).start()
  job3 = Process(target=printState).start()
  job4 = Process(target=cameraMonitor).start()
  job5 = Process(target=setState).start()
