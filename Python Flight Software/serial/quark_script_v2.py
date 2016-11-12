import serial
import threading
import binascii
from time import sleep
import crc16
import string
import sys

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

class Quark:
  def __init__(self):
    self.serial_connection = serial.Serial("/dev/ttyUSB0", 921600, timeout=0.5)
    self.serial_connection.flushInput()

  def nop(self):
    self._send("6e0000000000", "")
    self._get_and_check_response()

  def FFC_MODE_SELECT(self):
    self._send("6e00000B0000", '')
    self._get_and_check_response()

  def _get_and_check_response(self):
    response = self.serial_connection.read(self.serial_connection.inWaiting())
    if response: #Something wrong here: infinite no response
      self.response = fromCam(response)
      return True
    else:
      print "No response from cam."

  
  def simple_read(self):
    # need to sleep here, python is too fast for the camera
    sleep(0.01)
    h = ''
    print 'inWaiting(): ', self.serial_connection.inWaiting()
    data = self.serial_connection.read(self.serial_connection.inWaiting())
    if len(data) > 0:
      print len(data)
      h = binascii.hexlify(data)
    return h

  # creates and sends binary serial packet to camera
  def _send(self, header, body = ''):
    #print 'header: ', header, 'body: ', body
    hex_string_1 = ''
    h_0 = binascii.a2b_hex(header)
    crc_0 = crc16.crc16xmodem(h_0)
    #print 'crc_0: ',tohex(crc_0)
    h_1 = h_0 + tohex(crc_0)
    if len(body):
        h_2 = h_1 + binascii.a2b_hex(body)
    else:
        h_2 = h_1
    crc_1 = crc16.crc16xmodem(h_2)
    h_3 = h_2 + tohex(crc_1)
    #print 'crc_1: ',tohex(crc_1)
    #print 'final serial packet: ', h_3
    x = self.serial_connection.write(h_3)
    sleep(0.05)

  # Returns location and total size of snapshot buffer
  def _sb_startandsize(self):
    self._send("6e0000d60004", "ffff0013")
    #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
    self._get_and_check_response()

  # Returns the number of snapshots currently in buffer and the number of
  # snapshot buffer bytes they take up
  def _sb_numusedsnaps(self):
    self._send("6e0000d60004", "fffe0013")
    #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
    self._get_and_check_response()

  def _getsnapheader(self, snap_number):
    self._send("6e0000d60004", "80" + tohexstr(snap_number) + "0013")
    #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
    self._get_and_check_response()

  def _sizeaddresssnapbynumber(self, snap_number):
    self._send("6e0000d60004", "00" + tohexstr(snap_number) + "0013")
    #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
    self._get_and_check_response()

  def _add_to_hex_string(self, hex_string, intval):
    var = int('0x' + hex_string, 16)
    var += intval
    data = format(var, 'x')
    if len(data)%2 == 1:
      data = '0' + data
    return data

  def _transfer_frame(self, snap_number):
    self._send("6e0000820004", "16" + tohexstr(snap_number) + "0001") 
    #message = self.simple_read()
    #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
    self._get_and_check_response()

  def take_picture(self, snap_number):
    self._transfer_frame(snap_number)
    if not self.response._status:
      print "bad cam response: ", binascii.b2a_hex(self.response._status)
      sys.exit()

    print "delaying for 1 second to let camera take picture..."
    sleep(1)
    print "delay over, beginning image read"
    self._sizeaddresssnapbynumber(snap_number)
    #self._sb_startandsize()
    #self._getsnapheader(0)
    #hexvalue = self.response.get_argument(0, 4)
    #print binascii.b2a_hex(hexvalue)
    #print int(binascii.b2a_hex(hexvalue))
    #return
    snap_address = binascii.b2a_hex(self.response.get_argument(0, 4))
    snapbytesize = binascii.b2a_hex(self.response.get_argument(4, self.response._argument_length))

    outfile = open("testbitmap.bmp", "ab") 
    while int(snapbytesize, 16) > 0:
      if int(snapbytesize, 16) >= 256:
        self._send("6e0000d20006",  snap_address + "0100")
        snap_address = self._add_to_hex_string(snap_address, 256)
        snapbytesize = self._add_to_hex_string(snapbytesize, -256)
      else:
        self._send("6e0000d20006",  snap_address + snapbytesize)
        snap_address = self._add_to_hex_string(snap_address, int(snapbytesize, 16))
        snapbytesize = self._add_to_hex_string(snapbytesize, -int(snapbytesize, 16))

      
      #self.response = fromCam(self.serial_connection.read(self.serial_connection.inWaiting()))
      self._get_and_check_response()
      #print "In while loop, snapbytesize = ", snapbytesize
      #print "snap_address = ", snap_address
      #print "Response headers: "
      #self.response.print_headers()
      sleep(0.07)
      outfile.write(self.response._argument)

    outfile.close()

  # get the number of snaps stored on camera
  def parse_numSnaps_Response(self):
      self._send("630000d60004", "fffe0013")
      if (_get_and_check_response):
          # could be bytes 0-3, we'll find out when we test
          #currentNumSnaps = int(response.get_argument(4,7), 16)
          #return currentNumSnaps
          return int(response.get_argument(4,7), 16)

  
  def checkNumSnaps(self, max_count = self.get_max_quark_Snap_Count()):
     return (self.parse_numSnaps_Response() <= max_count) 

  # make sure the status message is okay
  def verify_image_valid(self, resp):
      if resp._status != '00':
          return False
      return True

  # get the number of images, stored in a flat-file
  def get_number_of_Images(self):_in
      f = open('numIm.txt','r')
      numImages = f.readline()
      f.close()
      return int(numImages)
    
  def get_images_in_directory(self):
      int count
      files = os.listdir()
      for name in files
          if name.endswith(".bmp")
              count ++
      return count           

  def get_max_quark_Snap_Count(self):
      f = open('maxSnapcount.txt','r')
      maxImages = f.readline()
      f.close()
      return int(maxImages)

  def increment_number_of_Images(self):
      f = open('numIm.txt','r+')
      images = int(f.readline()) + 1
      f.write(images)
      f.close()
      
  def check_number_of_images(self):
      return bool(get_number_of_Images() == get_images_in_directory())

class fromCam:
  def __init__(self, response):
    # break each part of the camera response into parts outlined in quark software idd
    self._process_code = binascii.b2a_hex(response[0])
    self._status = binascii.b2a_hex(response[1])
    self._reserved = binascii.b2a_hex(response[2])
    self._function_code = binascii.b2a_hex(response[3])
    self._bc = binascii.b2a_hex(response[4] + response[5])
    self._crc1_msb = binascii.b2a_hex(response[6])
    self._crc1_lsb = binascii.b2a_hex(response[7])
      # first 16 bytes of camera response are guaranteed to be structured this way every time.
      # next comes the argument which can be variable length and then is followed by two extra bytes of CRC-16 xmodem

    # parse argument based on _bc values (bc = byte count)
    self._argument_length = int('0x' + self._bc, 16)
    #print self._argument_length
    self._argument = ''
    for i in range(8, (8+self._argument_length)):
      self._argument += response[i]

    #print "argument: " + str(self._argument) + "\nargument_length: " + str(self._argument_length)
   # print "response: " + str(binascii.b2a_hex(response))

    self._crc2_msb = (8 + self._argument_length) + 1 # first crc byte is one byte past the end of the argument
    self._crc2_lsb = (8 + self._argument_length) + 2 # two bytes past end

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
  
  def get_argument(self, start_index = 0, end_index = -1):
    if end_index < 0:
      end_index = self._argument_length
    return self._argument[start_index : end_index]

  

def main():
  camera = Quark()
  camera.nop() 
  while not camera.response:                 #stuck in infinite loop
    sleep(0.1)
    camera.nop()

  #print "FFC_MODE_SELECT: " + str(camera.FFC_MODE_SELECT())
  #camera._getsnapheader()
  #print binascii.b2a_hex(camera.response.get_argument())
  camera.take_picture(1)
  print "size and address: " + str(camera._sizeaddresssnapbynumber(1))
  print "nop: " + str(camera.nop() ) 
  print "start address and mem size: " + str(camera._sb_startandsize() )
  print "number of snaps: " + str(camera._sb_numusedsnaps() )
  print "response.get_argument(): " + str(binascii.b2a_hex(camera.response.get_argument()) )

main()

# PROTOTYPING CODE FOR ERASING PREVIOUS SNAPSHOTS
def find_address():
  size_location = []

  self._send('D6FFFE0013', '')              # Prompt Camera for num. snapshots
  raw_data = self.simple_read()             # Read response from camera (HEX)
  num_snaps = int('0x' + num_snaps[4:])     # Convert hex to int 
                                            # will work.

  for i in range(1, num_snaps+1):           # Compiles a list of addresses to delete
    size_location.append(camera._sizeaddresssnapbynumber(i)) 
                                            #GET_MEMORY_ADDRESS command(#214) in Flir IDD also appears to apply, not sure if it was used previously


def snap_erase():                           # Deletes the snap in given address
  for item in size_location:
    self._send('0xD4(' + item + ')') 
  # ERASE_MEMORY_BLOCK command(#212) with flash 
  # block calculated from find_address() as argument


























