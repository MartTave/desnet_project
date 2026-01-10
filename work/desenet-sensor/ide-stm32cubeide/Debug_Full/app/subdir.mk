################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/app/accelerometerapplication.cpp \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/app/factory.cpp \
/home/marttave/projects/desnet_project/work/desenet-sensor/src/app/joystickapplication.cpp 

OBJS += \
./app/accelerometerapplication.o \
./app/factory.o \
./app/joystickapplication.o 

CPP_DEPS += \
./app/accelerometerapplication.d \
./app/factory.d \
./app/joystickapplication.d 


# Each subdirectory must supply rules for building sources it contributes
app/accelerometerapplication.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/app/accelerometerapplication.cpp app/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
app/factory.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/app/factory.cpp app/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
app/joystickapplication.o: /home/marttave/projects/desnet_project/work/desenet-sensor/src/app/joystickapplication.cpp app/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -DIDE_STM32CUBEIDE -DTC_STM32CUBEIDE -DUSE_DISPLAY -DDISPLAY_DRIVER_SSD1608 -c -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/.." -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/../src" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/mcu" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/nucleo-stm32l476rg/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform/platform-common/board" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/platform" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw" -I"/home/marttave/projects/desnet_project/work/desenet-sensor/src/common/mdw/desenet" -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-app

clean-app:
	-$(RM) ./app/accelerometerapplication.cyclo ./app/accelerometerapplication.d ./app/accelerometerapplication.o ./app/accelerometerapplication.su ./app/factory.cyclo ./app/factory.d ./app/factory.o ./app/factory.su ./app/joystickapplication.cyclo ./app/joystickapplication.d ./app/joystickapplication.o ./app/joystickapplication.su

.PHONY: clean-app

