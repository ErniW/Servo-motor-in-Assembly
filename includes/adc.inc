.equ ADC_BASE,          0x40012000
.equ ADC1_BASE,         (ADC_BASE + 0x00)

.equ ADC_SR_OFFSET,     0x00
.equ ADC_CR2_OFFSET,    0x08
.equ ADC_SQR1_OFFSET,   0x2C
.equ ADC_DR_OFFSET,     0x4C

.equ ADC1_SR,            (ADC1_BASE + ADC_SR_OFFSET)
.equ ADC1_CR2,           (ADC1_BASE + ADC_CR2_OFFSET)
.equ ADC1_SQR1,          (ADC1_BASE + ADC_SQR1_OFFSET)
.equ ADC1_DR,            (ADC1_BASE + ADC_DR_OFFSET)

.equ ADC_SEQ_LEN_1,     0
.equ ADC_CR2_CONT,      (1 << 1)
.equ ADC_CR2_ADON,      (1 << 0)
.equ ADC_CR2_SWSTART,   (1 << 30)
.equ ADC_SR_EOC,        (1 << 1)
