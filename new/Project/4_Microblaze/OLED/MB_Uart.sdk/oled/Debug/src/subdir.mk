################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/testperiph.c \
../src/xgpio_tapp_example.c \
../src/xil_oled.c \
../src/xintc_tapp_example.c \
../src/xspi_intr_example.c \
../src/xspi_selftest_example.c 

OBJS += \
./src/testperiph.o \
./src/xgpio_tapp_example.o \
./src/xil_oled.o \
./src/xintc_tapp_example.o \
./src/xspi_intr_example.o \
./src/xspi_selftest_example.o 

C_DEPS += \
./src/testperiph.d \
./src/xgpio_tapp_example.d \
./src/xil_oled.d \
./src/xintc_tapp_example.d \
./src/xspi_intr_example.d \
./src/xspi_selftest_example.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../oled_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v9.4 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


