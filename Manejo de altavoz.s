sonido: ldr      r2, =bitson
	ldr      r3, [r2]
	eors     r3, #1
	str      r3, [r2]
	mov      r3, #0b10000  
	streq    r3, [r1, #GPSET0] 
	strne    r3, [r1, #GPCLR0] 
	mov      r3, #0b1000
	str      r3, [r0, #STCS]
	ldr      r3, [r0, #STCLO]
	ldr      r2, =1136  
	add      r3, r2
	str      r3, [r0, #STC3]
	[...]
bitson: .word    0






































































