Description:
.There are two parameters in this IP, which are frequency and duty. The PWM_Ip can produce a changeable frequency and duty PWM wave.

Interface:
.clk_pwm:  clock input(100MHz)
.clr_pwm:  reset signal, when rst is '1', reset
.duty:     duty cycle in,  actually, the real duty cycle is: duty/20000
.PWM:      PWM signal output
