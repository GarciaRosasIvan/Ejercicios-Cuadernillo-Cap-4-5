mov      r0, #0b11010010    @ Modo  IRQ,  FIQ&IRQ  desact
msr      cpsr_c,  r0
mov      sp, #0x8000
mov      r0, #0b11010011    @ Modo  SVC,  FIQ&IRQ  desact
msr      cpsr_c,  r0
mov      sp, #0x8000000