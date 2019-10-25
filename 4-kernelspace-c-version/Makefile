obj-m := gpiotest.o
PWD := $(shell pwd)

KERNEL_SRC_DIR := ~/gpio-practice/4-kernelspace-c-version/linux
GCC_PREFIX := arm-linux-gnueabihf-

all:
	$(MAKE) -C $(KERNEL_SRC_DIR) M=$(PWD) modules ARCH=arm CROSS_COMPILE=$(GCC_PREFIX)
