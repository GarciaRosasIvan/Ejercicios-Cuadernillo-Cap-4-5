	.include   "inter.inc"
.text
	ADDEXC   0x18,  irq_handler


	mov      r0, #0b11010010 
	msr      cpsr_c,  r0
	mov      sp, #0x8000
	mov      r0, #0b11010011 
	sr      cpsr_c,  r0
	mov      sp, #0x8000000


	ldr      r0, =GPBASE
	mov      r1, #0b00001000000000000000000000000000
	str      r1, [r0, #GPFSEL0]

	mov      r1, #0b00000000000000000000000000000001
	str      r1, [r0, #GPFSEL1]

	mov      r1, #0b00000000000000000000011000000000
	str      r1, [r0, #GPSET0]


	mov      r1, #0b00000000000000000000000000001100
	str      r1, [r0, #GPFEN0]
	ldr      r0, =INTBASE


	mov      r1, #0b00000000000100000000000000000000

	str      r1, [r0, #INTENIRQ2]
	mov      r0, #0b01010011 
	msr      cpsr_c,  r0


bucle:   b         bucle

irq_handler:
	push     {r0, r1}
	ldr      r0, =GPBASE


	mov      r1, #0b00000000000000000000011000000000
	str      r1, [r0, #GPCLR0]

	ldr      r1, [r0, #GPEDS0]
	ands     r1, #0b00000000000000000000000000000100

	movne    r1, #0b00000000000000000000001000000000
	moveq    r1, #0b00000000000000000000010000000000
	str      r1, [r0, #GPSET0]


	mov      r1, #0b00000000000000000000000000001100
	str      r1, [r0, #GPEDS0]
	pop      {r0, r1}
	subs     pc, lr, #4
	ldr      r0, =GPBASE
	ldr      r1, =0b00001000000000000000000000000000
	str      r1, [r0, #GPFSEL0]

	ldr      r1, =0b00000000000000000000000000000001
	str      r1, [r0, #GPFSEL1]

	mov      r1, #0b00000000000000000000011000000000
	str      r1, [r0, #GPSET0]
	mov      r1, #0b00000000000000000000000000001100
	str      r1, [r0, #GPFEN0]
	ldr      r0, =INTBASE

	mov      r1, #0b00000000000100000000000000000000
	str      r1, [r0, #INTENIRQ2]
	mov      r0, #0b01010011 
	msr      cpsr_c,  r0
bucle:   b         bucle

