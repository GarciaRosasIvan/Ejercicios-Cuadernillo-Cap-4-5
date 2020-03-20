	 .set     GPBASE,    0x20200000
	 .set     GPFSEL0,   0x00
	 .set     GPSET0,    0x1c
	 .set     GPCLR0,    0x28
.text
	 ldr      r0, =GPBASE

	 mov      r1, #0b00001000000000000000000000000000
	 str      r1, [r0, #GPFSEL0] 

	 mov      r1, #0b00000000000000000000001000000000

bucle:   ldr      r2, =7000000
ret1:    subs     r2, #1 
	 bne      ret1
	 str      r1, [r0, #GPSET0]
	 ldr      r2, =7000000
ret2:    subs     r2, #1 
	 bne      ret2
	 str      r1, [r0, #GPCLR0]

	 b         bucle