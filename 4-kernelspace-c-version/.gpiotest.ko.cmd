cmd_/home/vivanov/rpi-gpio-test/kernel-version/gpiotest.ko := arm-linux-gnueabihf-ld -r  -EL -T ./scripts/module-common.lds -T ./arch/arm/kernel/module.lds  --build-id  -o /home/vivanov/rpi-gpio-test/kernel-version/gpiotest.ko /home/vivanov/rpi-gpio-test/kernel-version/gpiotest.o /home/vivanov/rpi-gpio-test/kernel-version/gpiotest.mod.o ;  true