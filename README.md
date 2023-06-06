# Servo-motor-in-Assembly
Playing around with timers on STM32F446RE to control a servo with potentiometer written purely in ARM assembly.

- Servo motor uses Timer 2 channel 1 which is binded to PA5 (D13 pin on board).
- Potentiometer uses ADC1 on pin A0.
- Delay is done via SysTick which uses interrupt.

To build and upload the code type `make compile upload`. Before doing that update STLink directory in makefile.