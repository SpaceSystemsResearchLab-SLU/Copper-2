import threading
from time import sleep

def spit_out_fives():
	"""thread worker function"""
	while True:
		print 5
		sleep(0.25)

def spit_out_three():
	while True:
		print 3
		sleep(0.25)

t1 = threading.Thread( spit_out_fives() )
t2 = threading.Thread( spit_out_three() )
threads = [t1, t2]

t1.start()
t2.start()
