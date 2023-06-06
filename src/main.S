.syntax unified
.thumb
.fpu fpv5-d16

.include "includes/servo_timer.inc"
.include "includes/main.inc"

.include "src/utils.S"
.include "src/servo_timer.S"
.include "src/systick.S"

.section .data
.align 4

.section .bss
.align 4

.section .text

.globl  main
.word   main

.thumb_func
main:

    mov BIT, ENABLE_FPU
    bl  bit_set
    dsb
    isb

    ldr REG, =RCC_AHB1ENR
    mov BIT, GPIOA_EN
    bl  bit_set

    ldr REG, =RCC_APB1ENR
    mov BIT, TIM2_EN
    bl  bit_set

    ldr REG, =GPIOA_MODER
    mov BIT, PA5_AF_MODE
    bl  bit_set

    ldr REG, =GPIOA_AFRL
    mov BIT, PA5_AF_1
    bl  bit_set

    bl  tim2_ch1_servo_init
    bl  systick_init
    

loop:

    ldr r1, =TIM2_CCR1
    mov r2, #500
    str r2, [r1]
    
    mov r0, #1000
    bl  delay_ms

    ldr r1, =TIM2_CCR1
    mov r2, #1500
    str r2, [r1]

    mov r0, #1000
    bl  delay_ms

    ldr r1, =TIM2_CCR1
    mov r2, #2500
    str r2, [r1]

    mov r0, #1000
    bl  delay_ms

    b   loop

.align
.end
