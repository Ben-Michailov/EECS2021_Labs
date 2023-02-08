c: 	DD 1024
d:	DD 2048
e:	DD 4096
f:	DD 8192
g:	DM 1

ld	x5, c(x0)
ld	x6, d(x0)
ld	x7, e(x0)
ld 	x8, f(x0)
add	x10, x5, x6
add	x10, x10, x7
add	x10, x10, x8
srli	x11, x10, 2
sd	x11, g(x0)