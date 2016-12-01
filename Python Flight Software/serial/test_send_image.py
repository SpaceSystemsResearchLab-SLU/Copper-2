def send_image_to_PIC():
  f = open('test.jpg','r')
  gpio = serial.Serial("/dev/ttyUSB1", 115200)  
  gpio.write('gobbledygook')
  f.close()
 
