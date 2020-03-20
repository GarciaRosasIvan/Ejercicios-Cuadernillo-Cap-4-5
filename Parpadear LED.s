irq_handler:
push     {r0,  r1, r2}
ldr      r0, =ledst 
ldr      r1, [r0] 
eors     r1, #1 
str      r1, [r0]

ldr      r0, =GPBASE

ldr      r1, =0b00001000010000100000111000000000
streq    r1, [r0, #GPSET0]
strne    r1, [r0, #GPCLR0]
