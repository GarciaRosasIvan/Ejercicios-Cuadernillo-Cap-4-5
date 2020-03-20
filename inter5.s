	ADDEXC   0x18,  irq_handler
	ADDEXC   0x1c,  fiq_handler
	

	mov      r0, #0b11010001 
	msr      cpsr_c,  r0
	mov      sp, #0x4000
	mov      r0, #0b11010010 
	sr      cpsr_c,  r0
	mov      sp, #0x8000
	mov      r0, #0b11010011  
	msr      cpsr_c,  r0
	mov      sp, #0x8000000

	ldr      r0, =GPBASE
	ldr      r1, =0b00001000000000000001000000000000
	str      r1, [r0, #GPFSEL0]

	ldr      r1, =0b00000000001000000000000000001001
	str      r1, [r0, #GPFSEL1]
	ldr      r1, =0b00000000001000000000000001000000
	str      r1, [r0, #GPFSEL2]

	ldr      r0, =STBASE
	ldr      r1, [r0, #STCLO]
	add      r1, #2
	str      r1, [r0, #STC1]
	str      r1, [r0, #STC3]
	
	ldr      r0, =INTBASE
	mov      r1, #0b0010
	str      r1, [r0, #INTENIRQ1]
	
	mov      r1, #0b10000011
	str      r1, [r0, #INTFIQCON]

	mov      r0, #0b00010011 
	msr      cpsr_c,  r0

bucle:   b         bucle