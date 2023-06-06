# Servo-motor-in-Assembly
Playing around with timers on STM32 to control a servo written purely in ARM assembly.

Servo motor uses Timer 2 channel 1 which is binded to PA5 (D13 pin on board).

### Todo:
- ADC knob
- Change systick to interrupt based routine (tried this but it's not working)