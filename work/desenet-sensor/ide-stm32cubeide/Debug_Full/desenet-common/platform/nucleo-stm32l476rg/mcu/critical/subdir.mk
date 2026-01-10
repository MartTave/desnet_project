################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu/critical/critical.c 

C_DEPS += \
./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.d 

OBJS += \
./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.o 


# Each subdirectory must supply rules for building sources it contributes
desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu/critical/critical.c desenet-common/platform/nucleo-stm32l476rg/mcu/critical/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-desenet-2d-common-2f-platform-2f-nucleo-2d-stm32l476rg-2f-mcu-2f-critical

clean-desenet-2d-common-2f-platform-2f-nucleo-2d-stm32l476rg-2f-mcu-2f-critical:
	-$(RM) ./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.cyclo ./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.d ./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.o ./desenet-common/platform/nucleo-stm32l476rg/mcu/critical/critical.su

.PHONY: clean-desenet-2d-common-2f-platform-2f-nucleo-2d-stm32l476rg-2f-mcu-2f-critical

