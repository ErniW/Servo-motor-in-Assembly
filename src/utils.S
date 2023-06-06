REG .req r0
BIT .req r1

bit_set:
    ldr r2, [REG]
    orr r2, r2, BIT
    str r2, [REG]
    bx  lr
