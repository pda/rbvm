; Perform addition
mov  a, 2
add  a, 4

; Convert single digit integer to ASCII
add  a, 0x30

; Build result string in memory
mov  0x10, "2 + 4 = "
mov  0x18, :a
mov  0x19, 0x0A

; Print 10 characters from memory
push 10
push 0x10
mov  a, 4
int  0
add  sp, 2
