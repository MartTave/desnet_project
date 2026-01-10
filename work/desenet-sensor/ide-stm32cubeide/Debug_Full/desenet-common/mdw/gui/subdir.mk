################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/gui/fontlookup.cpp \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/gui/monochromedisplaypainter.cpp 

OBJS += \
./desenet-common/mdw/gui/fontlookup.o \
./desenet-common/mdw/gui/monochromedisplaypainter.o 

CPP_DEPS += \
./desenet-common/mdw/gui/fontlookup.d \
./desenet-common/mdw/gui/monochromedisplaypainter.d 


# Each subdirectory must supply rules for building sources it contributes
desenet-common/mdw/gui/fontlookup.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/gui/fontlookup.cpp desenet-common/mdw/gui/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
desenet-common/mdw/gui/monochromedisplaypainter.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/gui/monochromedisplaypainter.cpp desenet-common/mdw/gui/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-desenet-2d-common-2f-mdw-2f-gui

clean-desenet-2d-common-2f-mdw-2f-gui:
	-$(RM) ./desenet-common/mdw/gui/fontlookup.cyclo ./desenet-common/mdw/gui/fontlookup.d ./desenet-common/mdw/gui/fontlookup.o ./desenet-common/mdw/gui/fontlookup.su ./desenet-common/mdw/gui/monochromedisplaypainter.cyclo ./desenet-common/mdw/gui/monochromedisplaypainter.d ./desenet-common/mdw/gui/monochromedisplaypainter.o ./desenet-common/mdw/gui/monochromedisplaypainter.su

.PHONY: clean-desenet-2d-common-2f-mdw-2f-gui

