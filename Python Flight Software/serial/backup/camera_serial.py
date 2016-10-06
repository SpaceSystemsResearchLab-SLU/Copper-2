import serial
import threading
import binascii
from time import sleep
import crc16
import string

class toCam:
  def __init__(self, ser):
    self._camera_connection = ser

  
  # Captures an 8 bit BMP snapshot from camera's video feed and stores it in next available space in flash buffer on camera
  # if no available space in buffer, camera responds with an error message
  def transfer_frame(self):
    self._send_to_camera('6e0000820004', '16000001')


  # retrieves the memory location of the beginning of the snapshot memory and the total size of snapshot memory in bytes
  def sb_las(self):
    self._send_to_camera('6e0000d60004', 'ffff0013')


  # retrieves the total number of snapshots in memory and the total number of bytes those snapshots take up
  def sb_tnab(self):
    self._send_to_camera('6e0000d60004', 'fffe0013')


  # gets snapshot header of given snapshot number, should always return BMP8 for us
  def snap_header(self, snap_number):
    self._send_to_camera('6e0000d60004', ('80' + snap_number + '0013'))


  # find address and size of specific snapshot, camera will return error if nothing in that snapshot slot
  def snap_aas(self, snap_number):
    if len(str(snap_number))%2 == 1:
      self._send_to_camera('6e0000d60004', ('00' + '0' + str(snap_number) + '0013'))
    else:
      self._send_to_camera('6e0000d60004', ('00' + str(snap_number) + '0013'))


  # command to actually read a snapshot (can only read up to 256 bytes at a time, will leave multiple reads up to caller)
  # if more than 256 bytes requested will only retrieve 256 bytes


  def _add_to_hex_string(self, hex_string, intval):
    var = int('0x' + hex_string, 16)
    var += intval
    data = format(var, 'x')
    if len(data)%2 == 1:
      data = '0' + data
    return data


  # test command specified in the quark software idd
  def test_command(self):
    self._send_to_camera('6e00000b0000')

  # creates and sends binatry serial packet to camera
  def _send_to_camera(self, header, body = ''):
    print 'header: ', header, 'body: ', body
    hex_string_1 = ''
    h_0 = binascii.a2b_hex(header)
    crc_0 = crc16.crc16xmodem(h_0)
    print 'crc_0: ',tohex(crc_0)
    h_1 = h_0 + tohex(crc_0)
    if len(body):
        h_2 = h_1 + binascii.a2b_hex(body)
    else:
        h_2 = h_1
    crc_1 = crc16.crc16xmodem(h_2)
    h_3 = h_2 + tohex(crc_1)
    print 'crc_1: ',tohex(crc_1)
    print 'final serial packet: ', h_3
    x = self._camera_connection.write(h_3)


  def read_snap(self, snap_address, snap_size):
    out_file = open('bitmap.bmp', 'ab')
    # Snap testing...
    snap_address = '01801000'
    snap_size = '00014436'
    # ...end Snap testing
    header = ''

    # translate hex strings to integer values for adding/subtracting
    address = int('0x' + snap_address, 16)
    size = int('0x' + snap_size, 16)

    # size is total size of snap in bytes, so if theres parts left to read, keep reading
    while size > 0:
     
      #print 'snap_address: ', snap_address
      #print 'address: ', address
      # if we can the maximum number of bytes then do so
      if size >= 256:
        print 'snap_address: ', snap_address, 'snap_size: ', snap_size
        self._send_to_camera('6e0000d20006', snap_address + '0100') # read 256 bytes
        address += 256 # increment the address to read
        snap_address = tohexstr(address)
        size -= 256 # decrement the number of bytes left in the snap
        snap_size = tohexstr(size)
      
      elif size < 256: # if less than max number of readable bytes then need to read the right amount
        if size > 15: # format the hex string so it gets translated into a 4 byte value
          snap_size = '00' + format(size, 'x')
        else:
          snap_size = '000' + format(size, 'x')

        print 'snap_address: ', snap_address, 'snap_size: ', snap_size
        print 'snap_address: ', snap_address, 'snap_size: ', snap_size
        self._send_to_camera('6e0000d20006', snap_address + snap_size) # read remaining bytes
        address += size
        snap_address = tohexstr(address)
        size -= size
        snap_size = tohexstr(size)
      
      # listen for camera response
      # read the first 8 bytes to get header and isolate response data
      header = self._camera_connection.read(8)
      header = binascii.b2a_hex(header)
      print header

      if len(header):
        # parse out arg size bytes of header and convert hex value into int
        arg_size = int(header[8] + header[9] + header[10] + header[11], 16)
        print 'arg_size: ', arg_size
        print self._camera_connection.inWaiting()
        # read argument into image file
        out_file.write(self._camera_connection.read(arg_size))
      else:
        for i in range(256):
          out_file.write('\x00')

        print 'NO RESPONSE at: ' + str(snap_address)

      #discard final two crc bytes
      self._camera_connection.flushInput()

    out_file.close()
    sleep(0.1)


  def simple_read(self):
    # need to sleep here, python is too fast for the camera
    sleep(0.01)
    h = ''
    print 'inWaiting(): ', self._camera_connection.inWaiting()
    data = self._camera_connection.read(self._camera_connection.inWaiting())
    if len(data) > 0:
      print len(data)
      h = binascii.hexlify(data)
    return h
   

class fromCam:
  def __init__(self, response):
    # break each part of the camera response into parts outlined in quark software idd
    self._process_code = response[0] + response[1]
    self._status = response[2] + response[3]
    self._reserved = response[4] + response[5]
    self._function_code = response[6] + response[7]
    self._bc = response[8] + response[9] + response[10] + response[11]
    self._crc1_msb = response[12] + response[13]
    self._crc1_lsb = response[14] + response[15]
    # first 16 bytes of camera response are guaranteed to be structured this way every time.
    # next comes the argument which can be variable length and then is followed by two extra bytes of CRC-16 xmodem

    # parse argument based on _bc values (bc = byte count)
    self._argument_length = int('0x' + self._bc, 16)
    #print self._argument_length
    self._argument = ''
    for i in range(16, (16+self._argument_length*2)):
      self._argument += response[i]

    #print self._argument

    self._crc2_msb = (16 + self._argument_length * 2) + 1 # first crc byte is one byte past the end of the argument
    self._crc2_lsb = (16 + self._argument_length * 2) + 2 # two bytes past end

  def print_headers(self):
    status_message = ''

    if self._status == '00':
      status_message = 'CAM_OK'
    elif self._status == '02':
      status_message = 'CAM_NOT_READY'
    elif self._status == '03':
      status_message = 'CAM_RANGE_ERROR'
    elif self._status == '04':
      status_message = 'CAM_CHECKSUM_ERROR'
    elif self._status == '05':
      status_message = 'CAM_UNDEFINED_PROCESS_ERROR'
    elif self._status == '06':
      status_message = 'CAM_UNDEFINED_FUNCTION_ERROR'
    elif self._status == '07':
      status_message = 'CAM_TIMEOUT_ERROR'
    elif self._status == '09':
      status_message = 'CAM_BYTE_COUNT_ERROR'
    elif self._status == '0A':
      status_message = 'CAM_FEATURE_NOT_ENABLED'

    print 'status: ', status_message
    print 'function_code: ' , self._function_code
    print 'argument byte count: ', self._bc

  def print_body(self):
    print 'response body: ', self._argument


def communication_handler():
  ser = serial.Serial('/dev/ttyUSB1', 921600, timeout=0.5)
  camera = toCam(ser)

  #open gpio's as a serial object
  port = '/dev/ttyAMA0'
  baud = 115200 # this can be adjusted as long as pic is set to match
  gpio = serial.Serial(port, baud) # reads seem to be non-blocking no matter what

  while True:
    while not gpio.inWaiting():
      sleep(0.5)

    while gpio.inWaiting():
      char = gpio.read(1)
      if char == '~':
        pic_command = gpio.read(gpio.inWaiting())
        print 'pic_command: ', pic_command
        if pic_command == 'TEST':
          camera.test_command()
          #print camera.simple_read()
          sleep(0.01)
          camresponse = camera.simple_read()
          print camresponse
          bytes_written = gpio.write(camresponse)
          print 'bytes written: ', bytes_written
        elif pic_command == 'TAKESNAP':
          camera.transfer_frame()
          response = fromCam(camera.simple_read())
          if response._status != '00':
            print 'cam error: ', response._status
          else:
            print 'good snap'
        elif pic_command[:7] == 'GETSNAP':
          camera.snap_aas(int(pic_command[7:], 10))
          response = fromCam(camera.simple_read())
          print "response: ", response.print_headers(),response.print_body()
          if response._status != '00':
            print 'cam error: ', response._status
          else:
            snap_address = response._argument[:8]
            print "snap address: ", snap_address
            snap_size = response._argument[8:]
            print "snap size: ", snap_size
            camera.read_snap(snap_address, snap_size)
      
      sleep(0.01)
  ser.close()
  gpio.close()


def tohex(intval):
  if (intval == 0):
    return '\x00\x00'
  else:
    data = format(intval, 'x')
    if len(data)%2 == 1:
      data = '0' + data
    elif len(data) == 2:
      data = '00' + data
  hexed = binascii.unhexlify(data)
  return hexed


def tohexstr(intval):
  if (intval == 0):
    return '00'
  else:
    data = format(intval, 'x')
    if len(data)%2 == 1:
      data = '0' + data
  return data


def main():
  port = "/dev/ttyUSB0"  
  #ser = serial.Serial(port, 57600)
# TESTING...
  #ser = serial.Serial(port, 921600)
  camera = toCam(ser)
  camera.test_command()

  print camera.simple_read()
  print "transferring frame"
  camera.transfer_frame()
  sleep(0.5)
  response = fromCam(camera.simple_read())
  if response._status != '00':
    print 'cam error: ', response._status
  else:
    print 'good snap'

  print "grabbing picture"
  camera.snap_aas(02)
  sleep(0.5)
  response = fromCam(camera.simple_read())
  print "response: ", response.print_headers(), response.print_body()
  if response._status != '00':
    print 'cam error: ', response._status
  else:
    snap_address = response._argument[:8]
    print "snap_address: ", snap_address
    snap_size = response._argument[8:]
    print "snap size: ", snap_size
    camera.read_snap(snap_address, snap_size)
    sleep(0.5)
    	
# END TESTING
  # spin up pic to camera communication thread
 # communication_thread = threading.Thread(target=communication_handler)
  #communication_thread.start()
  
  # set up camera connection object to send/recieve commands to/from camera
  #camera._send_to_camera('6e0000070002', '0007')
  #camera.read_snap('01815436', '00014436')
  #camera.read_snap('01801000', '00014436')
  #camera.sb_tnab()
  #camera.snap_aas(1)
  #response = fromCam(camera.simple_read())
  #response.print_headers()
  #response.print_body()
  #print camera.simple_read()

  ser.close()
main()
