; data
mov  0x0A, "Hello, world!\n"

; write
mov  a, 0x04
push 14
push 0x0A
int  0x00
add  sp, 2
