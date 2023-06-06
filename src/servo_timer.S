tim2_ch1_servo_init:
    push {lr}

    ldr r1, =TIM2_ARR
    mov r2, #ARR_VALUE
    str r2, [r1]

    ldr r1, =TIM2_PSC
    mov r2, #PRESCALER_VALUE
    str r2, [r1]

    ldr REG, =TIM2_CCMR1
    mov BIT, TIM_CCMR1_OC1M
    bl  bit_set

    ldr REG, =TIM2_CCER
    mov BIT, TIM_CCER_CC1E
    bl  bit_set

    ldr REG, =TIM2_CR1
    mov BIT, TIM_CR1_CEN
    bl  bit_set
    
    pop {lr}
    bx lr
