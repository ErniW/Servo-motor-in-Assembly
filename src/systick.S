.include "includes/systick.inc"

systick_init:
    push {lr}

    ldr r0, =SYSTICK_CTRL
    mov r1, #0
    str r1, [r0]

    ldr r0, =SYSTICK_VAL
    mov r1, #0
    str r1, [r0]

    ldr r0, =SYSTICK_LOAD
    mov r1, #(16000000 / 1000) - 1
    str r1, [r0]

    ldr r0, =SYSTICK_CTRL
    mov r1, SYSTICK_CLKSOURCE | SYSTICK_CTRL_EN
    str r1, [r0]

    pop {lr}
    bx  lr

# Register used: r1 = time counter
delay_ms:
    push {lr}
    ldr  r1, =SYSTICK_CTRL
    mov  r4, #SYSTICK_COUNTFLAG

    wait:   # Wait until all ms passes
    
        wait_ms:    # Wait until next ms tick occured in Systick
            ldr r2, [r1]
            tst r2, r4
            beq wait_ms

        subs r0, r0, #1     # Substract 1 ms from counter
        bne  wait

    pop {lr}
    bx  lr
