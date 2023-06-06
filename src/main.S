.syntax unified
.thumb
.fpu fpv5-d16

.include "includes/servo_timer.inc"
.include "includes/main.inc"

.include "src/utils.S"
.include "src/servo_timer.S"
// .include "src/systick.S"

.globl delay_counter
.globl adc_value

.section .data
.align 4

    delay_counter: .word 0
    adc_value: .word 0

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

    ldr REG, =RCC_APB2ENR
    mov BIT, ADC1_EN
    bl  bit_set

    ldr REG, =GPIOA_MODER
    mov BIT, PA5_AF_MODE | PA0_ADC_MODE
    bl  bit_set

    ldr REG, =GPIOA_AFRL
    mov BIT, PA5_AF_1
    bl  bit_set

    bl  tim2_ch1_servo_init
    
    bl  adc_init
    bl  adc_start_conversion
    bl  systick_init

loop:
    bl read_adc

    ldr r0, =adc_value
    ldr r1, [r0]
    mov r2, #2
    udiv r1, r1, r2
    add r1, r1, #500

    ldr r2, =TIM2_CCR1
    mov r3, r1
    str r3, [r2]

    ldr r0, =delay_counter
    mov r1, #20
    str r1, [r0]
    bl  delay_ms

    b   loop

.align
.end
