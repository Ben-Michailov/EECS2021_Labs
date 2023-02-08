s1: DC "Please enter integer value:\0"
s2: DC "Please enter memory address:\0"

addi x28, x0, s1 

addi x29, x0, s2

loop:
ecall x0, x28, 4
ecall x5, x0, 5
ecall x0, x29, 4
ecall x6, x0, 7

sd x5, 0(x6)

jal x1, loop
