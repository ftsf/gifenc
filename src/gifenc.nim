{.compile: "gifenc.c".}

type
  GIF* = object
    w*: uint16
    h*: uint16
    depth*: cint
    fd*: cint
    offset*: cint
    nframes*: cint
    frame*: ptr uint8
    back*: ptr uint8
    partial*: uint32
    buffer*: array[0x000000FF, uint8]


proc newGIF*(fname: cstring; width: uint16; height: uint16; palette: ptr uint8;
             depth: cint; loop: cint): ptr GIF {.importc:"new_gif",cdecl.}
proc addFrame*(gif: ptr GIF; delay: uint16) {.importc:"add_frame",cdecl.}
proc close*(gif: ptr GIF) {.importc:"close_gif",cdecl.}
