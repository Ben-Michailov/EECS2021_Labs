a: 	DD 0xAAAABBBBCCCCDDDD
b: 	DD 0x4444333322221111
c: 	DM 8

	ld x5, a(x0)
	ld x6, b(x0)

	add x7, x5, x6
	sd x7, 16(x0)

	sub x7, x5, x6
	sd x7, 24(x0)

	sub x7, x6, x5
	sd x7, 32(x0)

	and x7, x5, x6
	sd x7, 40(x0)

	or x7, x5, x6
	sd x7, 48(x0)

	xor x7, x6, x5
	sd x7, 56(x0)

	xori x7, x5, -1
	addi x7, x7, 1
	sd x7, 64(x0)

	xori x7, x6, -1
	addi x7, x7, 1
	sd x7, 72(x0)
	