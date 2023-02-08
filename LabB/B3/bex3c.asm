dir: DC "John"
DC "11111"
DC "Nick"
DC "22222"
DC "Sara"
DC "11111"
DC "Nick"
DC "33333"
DD 0 

s1: DC "Enter a phone or a name\nto search for:\0"



addi x28, x0, s1 

addi x6, x0, 0

ecall x1, x28, 4
ecall x5, x0, 8

loopName:
ld x7, dir(x6) 
addi x6, x6, 16
bne x5, x7, condition1
ecall x0, x7, 3
addi x6, x6, -8
ld x7, dir(x6) 
ecall x0, x7, 3
addi x6, x6, 8
condition1: ld x7, dir(x6) 
addi x8, x6, -8
ld x8, dir (x8)
beq x7, x0, exit1
beq x8, x0, exit1
jal x1, loopName

exit1: addi x6, x0, 8

loopNumber:
ld x7, dir(x6) 
addi x6, x6, 16
bne x5, x7, condition2
addi x8, x6, -24
ld x7, dir(x8) 
ecall x0, x7, 3
addi x8, x8, 8
ld x7, dir(x8) 
ecall x0, x7, 3
condition2: 
addi x8, x6, -8
ld x8, dir (x8)
beq x8, x0, exit2
beq x7, x0, exit2
jal x1, loopNumber

exit2:
ebreak x0, x0, 0


