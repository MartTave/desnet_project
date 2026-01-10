################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/abstractapplication.cpp \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/net.cpp \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/networkentity.cpp 

OBJS += \
./desenet-common/mdw/desenet/sensor/abstractapplication.o \
./desenet-common/mdw/desenet/sensor/net.o \
./desenet-common/mdw/desenet/sensor/networkentity.o 

CPP_DEPS += \
./desenet-common/mdw/desenet/sensor/abstractapplication.d \
./desenet-common/mdw/desenet/sensor/net.d \
./desenet-common/mdw/desenet/sensor/networkentity.d 


# Each subdirectory must supply rules for building sources it contributes
desenet-common/mdw/desenet/sensor/abstractapplication.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/abstractapplication.cpp desenet-common/mdw/desenet/sensor/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
desenet-common/mdw/desenet/sensor/net.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/net.cpp desenet-common/mdw/desenet/sensor/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
desenet-common/mdw/desenet/sensor/networkentity.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet/sensor/networkentity.cpp desenet-common/mdw/desenet/sensor/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-desenet-2d-common-2f-mdw-2f-desenet-2f-sensor

clean-desenet-2d-common-2f-mdw-2f-desenet-2f-sensor:
	-$(RM) ./desenet-common/mdw/desenet/sensor/abstractapplication.cyclo ./desenet-common/mdw/desenet/sensor/abstractapplication.d ./desenet-common/mdw/desenet/sensor/abstractapplication.o ./desenet-common/mdw/desenet/sensor/abstractapplication.su ./desenet-common/mdw/desenet/sensor/net.cyclo ./desenet-common/mdw/desenet/sensor/net.d ./desenet-common/mdw/desenet/sensor/net.o ./desenet-common/mdw/desenet/sensor/net.su ./desenet-common/mdw/desenet/sensor/networkentity.cyclo ./desenet-common/mdw/desenet/sensor/networkentity.d ./desenet-common/mdw/desenet/sensor/networkentity.o ./desenet-common/mdw/desenet/sensor/networkentity.su

.PHONY: clean-desenet-2d-common-2f-mdw-2f-desenet-2f-sensor

