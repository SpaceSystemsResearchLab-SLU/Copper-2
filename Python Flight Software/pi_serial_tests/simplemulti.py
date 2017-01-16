from multiprocessing import *
from flat_file_getandset import *
from time import sleep

def printStatus():
  while True:
    print getStatus()
    print '------------------'
    sleep(0.25)

def changeTheStatus():
  while True:
    changeStatus()
    sleep(0.25)

if __name__ == '__main__':
  job1 = Process(target=printStatus).start()
  job2 = Process(target=changeTheStatus).start()
