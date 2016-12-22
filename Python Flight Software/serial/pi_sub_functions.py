import picamera

def take_pi_picture(FILENAME):
    camera = picamera.PiCamera()
    camera.capture(FILENAME)
