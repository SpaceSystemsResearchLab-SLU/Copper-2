from multiprocessing import *
from flat_file_getandset import *
from time import sleep
from picamera import *
from datetime import *
import sys
import os


def listen():
  #while True:
    if getMessage() == 'pics':
      setTakePicture(1)

def talk():
  #while True:
    if getSendPicResponse() == '1':
      print 'Sending message!'
      setSendPicResponse(0)

def printState():
  #while True:
    print 'Message: ' + getMessage()
    print 'take_picture: ' + getTakePicture()
    print 'send_pic_response: ' + getSendPicResponse()
    print '-------------------'
    sleep(1)

def cameraMonitor():
  #while True:
    if getTakePicture() == '1':
      print 'Taking Picture!'
      setTakePicture(0)
      setMessage("")
      setSendPicResponse(1)
      #### FOR RASPBERRY PI ONLY ####
      fn = '{:%m-%d-%Y_%H:%M:%S}'.format(datetime.now()) + '.jpg' # name with time
      cam = PiCamera()
      cam.capture(fn)
      print 'Picture Taken'
      ###############################

def setState(newstdin):
  #while True:
    sys.stdin = newstdin
    answer = raw_input('Message[n to not change]: ')
    if answer.lower().strip() != 'n':
      setMessage(str(answer))

if __name__ == '__main__':
  while True:
    job1 = Process(target=talk)
    job2 = Process(target=listen)
    job3 = Process(target=printState)
    job4 = Process(target=cameraMonitor)
    newstdin = os.fdopen(os.dup(sys.stdin.fileno()))
    job5 = Process(target=setState, args=(newstdin,))

    jobs = [job1, job2, job3, job4, job5]

    for job in jobs:
      job.start()
      job.join()

#  while len(jobs)>0:
#    print 'Talk: ' + str(job1.is_alive())
#    print 'Listen: ' + str(job1.is_alive())
#    print 'printState: ' + str(job1.is_alive())
#    print 'camMon: ' + str(job1.is_alive())
#    sleep(0.5)
#
#    if not job4.is_alive():
#      job4 = Process(target=cameraMonitor).start() # re-create process

