#======================================================================
# BG Converter
# 
# STABLE
#======================================================================

#======================================================================
# -------------------------------------------------
# Subs
# -------------------------------------------------

def get_val(string_in):
  got_this_str=""
  for do_loop_for in string_in:
    got_this_str = got_this_str + ("0"+((hex(ord(do_loop_for)))[2:]))[-2:]
  return(got_this_str)

def write_line(in_offset):
  input_file.seek(in_offset)
  
  a = int(get_val(input_file.read(1)),16) & 0x0F
  b = int(get_val(input_file.read(1)),16) & 0x0F
  c = int(get_val(input_file.read(1)),16) & 0x0F
  d = int(get_val(input_file.read(1)),16) & 0x0F
  e = int(get_val(input_file.read(1)),16) & 0x0F
  f = int(get_val(input_file.read(1)),16) & 0x0F
  g = int(get_val(input_file.read(1)),16) & 0x0F
  h = int(get_val(input_file.read(1)),16) & 0x0F
      
  a = a << 4
  a = a+b
  c = c << 4
  c = c+d
  e = e << 4
  e = e+f
  g = g << 4
  g = g+h
      
  out_art.write(chr(a))
  out_art.write(chr(c))
  out_art.write(chr(e))
  out_art.write(chr(g))

def write_cell(cell_off):
  global cells_used
  
  rept = 8
  while rept:
    write_line(cell_off)
    cell_off += x_size
    rept -= 1
  cells_used += 1
    
def seek_cell(x,y):
  x = x<<3
  y = y*(x_size*8)
  
  out_offset=x+y
  return(out_offset)

def chks_make(lay):
  d7 = 0
  
  d4 = 0
  d1 = 8
  while d1:
    input_file.seek(lay)
    d2 = 8
    while d2:
      byte = int(get_val(input_file.read(1)),16)
      if byte != 0:
	if byte < 0x30:
	  d3 = byte + d4 + (d7 & 0xFFF)
	  d7 += d3
      d4 += 1
      d2 -= 1
    lay += x_size
    d1 -= 1

  return(d7)
    
#======================================================================
# -------------------------------------------------
# Init
# -------------------------------------------------

cells_used = 0

#======================================================================
# -------------------------------------------------
# Start
# -------------------------------------------------

print "* Converting *"
input_file = open("in.tga","rb")
out_art    = open("art.bin","wb")
out_pal    = open("pal.bin","wb")
out_map    = open("map.bin","wb")

input_file.seek(0x5)					#$05, palsize
size_pal = int(get_val(input_file.read(1)),16)

input_file.seek(0xC)					#$0C, xsize,ysize (little endian)
x_r = int(get_val(input_file.read(1)),16)
x_l = (int(get_val(input_file.read(1)),16)<<8)
x_size = x_l+x_r
y_r = int(get_val(input_file.read(1)),16)
y_l = (int(get_val(input_file.read(1)),16)<<8)
y_size = (y_l+y_r)

# ----------------------
# Write palette
# ----------------------

input_file.seek(0x12)
d0 = size_pal
while d0:
  b = int(get_val(input_file.read(1)),16)
  g = int(get_val(input_file.read(1)),16)
  r = int(get_val(input_file.read(1)),16)
  
  r = r >> 3
  g = g >> 3
  b = b >> 3
  
  g = g << 5
  b = b << 10
  bgr = b+g+r&0x7FFF
  out_pal.write(chr(bgr>>8))
  out_pal.write(chr(bgr&0xFF))
  #r = r >> 5
  #r = r << 1
  #g = g >> 5
  #g = g << 1
  #b = b >> 5
  #b = b << 1
  #g = g << 4
  #gr = g+r
  #out_pal.write(chr(b))
  #out_pal.write(chr(gr))
  d0 -= 1

out_art.write(chr(0)*0x20)

#======================================================================
# -------------------------------------------------
# The best part
# -------------------------------------------------

#input_file.seek(4,True)					#Image data

# ----------------------
# Filler
# ----------------------

vram=1
image_addr=input_file.tell()
  
y_pos=0
cell_y_size=(y_size>>3)
while cell_y_size:
  x_pos=0
  cell_x_size=(x_size>>3)
  while cell_x_size:
    d1 = 0
    if chks_make(image_addr+seek_cell(x_pos,y_pos)) != 0:
      write_cell(image_addr+seek_cell(x_pos,y_pos))
      d1=vram
      vram+=1
    out_map.write(chr(int((d1&0xFF00)>>8)&0xFF)+chr(int(d1)&0xFF))
    x_pos+=1
    cell_x_size -= 1
  y_pos+=1
  cell_y_size -= 1

#======================================================================

print "cells used:",hex(cells_used)
print "Done."
input_file.close()
out_art.close()
out_pal.close()
out_map.close()
