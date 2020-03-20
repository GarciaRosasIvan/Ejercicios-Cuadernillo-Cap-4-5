	ldr      r2, =cuenta
	
	
	ldr      r3, =0b00001000010000100000111000000000
	str      r3, [r1, #GPCLR0] 
	ldr      r3, [r2]  
	subs     r3, #1 
	moveq    r3, #6    
	str      r3, [r2] 
	ldr      r3, [r2, +r3, LSL #2]
	str      r3, [r1, #GPSET0]
	mov      r3, #0b0010
	str      r3, [r0, #STCS]
	ldr      r3, [r0, #STCLO]
	ldr      r2, =200000  
	add      r3, r2
	str      r3, [r0, #STC1]
	[...]
cuenta: .word    1                

secuen: .word    0b1000000000000000000000000000
	.word    0b0000010000000000000000000000
	.word    0b0000000000100000000000000000
	.word    0b0000000000000000100000000000
	.word    0b0000000000000000010000000000
	.word    0b0000000000000000001000000000




















































