a: 	DD 1, 5, -7, 23, -5
b:	DD 3, -2, 4, 11, -7
dst: 	DM 1
	addi x7, x0, 0
	addi x8, x0, b
	addi x9, x8, b

loop:	ld x5, 0(x7)
	ld x6, 0(x8)
	beq x6, x0, end
	add x10, x5, x6
	sd x10, dst(x9)
	addi x7, x7, 8
	addi x8, x8, 8
	addi x9, x9, 8
	beq x0, x0, loop
 		 

end: 	ebreak x0, x0, 0
