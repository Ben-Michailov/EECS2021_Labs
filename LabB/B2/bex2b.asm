src: 	DD 121, 33, -5, 242, -45, -12, 0
	addi x7, x0, 0
	addi x8, x0, 0
	ld x5, src(x7)
	beq x5, x0, end
 		 
loop:	addi x7, x7, 8
	ld x6, src(x7)
	bge x6, x5, skip
	addi x5, x6, 0
	addi x8, x7, 0
skip:	beq x6, x0, end
	beq x0, x0, loop

end: 	ld x6, src(x0)
	sd x6, 0(x8)
	sd x5, 0(x0)