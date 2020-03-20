	 ldr      r0, =GPBASE
	 
	 mov      r1, #0b00000000000000000001000000000000
	 str      r1, [r0, #GPFSEL0] 
	 
	 mov      r1, #0b00000000000000000000000000010000
	 ldr      r2, =STBASE

bucle:   bl        espera
	 str      r1, [r0, #GPSET0]
	 bl        espera   
	 str      r1, [r0, #GPCLR0]
	 b         bucle


espera:  ldr      r3, [r2, #STCLO] 
	 ldr      r4, =1136
	 add      r4, r3     
ret1:    ldr      r3, [r2, #STCLO]
	 cmp      r3, r4 
	 bne      ret1 
	 bx       lr