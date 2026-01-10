################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include xf/subdir.mk
-include platform/nucleo-stm32l476rg/subdir.mk
-include desenet-common/platform/platform-common/board/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/mcu/hal/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/mcu/critical/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/mcu/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/desenet/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/transceiver/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/display/eplib/hal/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/display/eplib/fonts/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/display/eplib/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/display/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/accel/subdir.mk
-include desenet-common/platform/nucleo-stm32l476rg/board/subdir.mk
-include desenet-common/mdw/gui/subdir.mk
-include desenet-common/mdw/desenet/sensor/subdir.mk
-include desenet-common/mdw/desenet/subdir.mk
-include desenet-common/mdw/clockwork/subdir.mk
-include app/subdir.mk
-include Drivers/STM32L4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(CCM_DEPS)),)
-include $(CCM_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CXXM_DEPS)),)
-include $(CXXM_DEPS)
endif
ifneq ($(strip $(C++M_DEPS)),)
-include $(C++M_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := desenet-sensor
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
desenet-sensor.elf \

MAP_FILES += \
desenet-sensor.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
desenet-sensor.list \


# All Target
all: main-build

# Main-build Target
main-build: desenet-sensor.elf secondary-outputs

# Tool invocations
desenet-sensor.elf desenet-sensor.map: $(OBJS) $(USER_OBJS) /home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/STM32L476RGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-g++ -o "desenet-sensor.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/home/marttave/projects/desnet_project/work/desenet-sensor/ide-stm32cubeide/STM32L476RGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="desenet-sensor.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

desenet-sensor.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "desenet-sensor.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout desenet-sensor.elf desenet-sensor.list desenet-sensor.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
