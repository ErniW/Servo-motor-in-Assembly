PROJ_NAME = servo
BUILD_DIR = ./build
STLINK_DIR = ./stlink/bin

STARTUP = ./STM32F446RE/startup_stm32f446retx.s
LINKER = ./STM32F446RE/STM32F446RETX_FLASH.ld

SRCS = ./src/main.S

FLAGS =  -mthumb
FLAGS += -mcpu=cortex-m4
FLAGS += -mfloat-abi=hard -mfpu=fpv5-d16
FLAGS += -g

compile:
	arm-none-eabi-as $(FLAGS) $(SRCS) $(STARTUP) -o $(BUILD_DIR)/$(PROJ_NAME).o -w
	arm-none-eabi-ld -T $(LINKER) -o $(BUILD_DIR)/$(PROJ_NAME).elf $(BUILD_DIR)/$(PROJ_NAME).o
	arm-none-eabi-objcopy -O binary $(BUILD_DIR)/$(PROJ_NAME).elf $(BUILD_DIR)/$(PROJ_NAME).bin

upload:
	$(STLINK_DIR)/st-flash --reset write $(BUILD_DIR)/$(PROJ_NAME).bin 0x8000000