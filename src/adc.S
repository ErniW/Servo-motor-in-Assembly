.syntax unified
.thumb
.include "includes/adc.inc"

adc_init:
    push {lr}

    ldr r1, =ADC1_SQR1
    mov r2, ADC_SEQ_LEN_1
    str r2, [r1]

    ldr REG, =ADC1_CR2
    mov BIT, ADC_CR2_ADON
    bl  bit_set

    pop {lr}
    bx  lr


adc_start_conversion:

    push {lr}

    ldr  REG, =ADC1_CR2
    movw BIT, ADC_CR2_CONT 
    movt BIT, (1 << 14) // .equ ADC_CR2_SWSTART,   (1 << 30) minus 16 lower bits
    bl   bit_set

    pop {lr}
    bx  lr


read_adc:
    push {lr}

    ldr r0, =ADC1_SR
    mov r2, ADC_SR_EOC

    wait_for_adc_conversion:
        ldr r1, [r0]
        tst r1, r2
        beq wait_for_adc_conversion

    ldr r0, =ADC1_DR
    ldr r1, [r0]
    ldr r2, =adc_value
    str r1, [r2]

    pop {lr}
    bx  lr
