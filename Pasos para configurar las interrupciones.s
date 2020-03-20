	 .macro     ADDEXC   vector,  dirRTI
	   ldr      r1, =(\dirRTI -\ vector+0xa7fffffb)
	   ROR      r1, #2
	   str      r1, [r0, #\ vector]
         .endm