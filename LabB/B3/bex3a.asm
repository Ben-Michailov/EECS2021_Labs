c1: DC "Hello \0"
c2: DC "!\0"
s1: DC "What is your name?\0"

ld x28, c1(x0)
ld x29, c2(x0)
addi x30, x0, s1

ecall x0, x30, 4 ; what is your name
ecall x31, x0, 9 ;enter name
ecall x1, x28, 3 ;hello
ecall x1, x31, 4 ;user name
ecall x0, x29, 3 ;!