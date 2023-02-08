src: 	DD -1, 55, -3, 7, 0
	add x7, x0, x0
	ld x5, src(x7)
	beq x5, x0, end
 		 
loop:	addi x7, x7, 8
	ld x6, src(x7)
	blt x6, x5, skip
	addi x5, x6, 0
skip:	beq x6, x0, end
	beq x0, x0, loop

end: 	ebreak x0, x0, 0