
***1. Bash script version - run it on RPi:***
```
pi@raspberrypi:~ $ cd gpio-practice/1-bash-version/  
pi@raspberrypi:~/gpio-practice/1-bash-version $ sudo ./gpiotest.sh
```



***2. Python script version - run it on RPi:***
```
pi@raspberrypi:~ $ cd gpio-practice/2-python-version/  
pi@raspberrypi:~/gpio-practice/2-python-version $ python2 gpiotest.py
```



***3. Userspace C version - compile it on RPi:***
```
pi@raspberrypi:~ $ cd gpio-practice/3-userspace-c-version/  
pi@raspberrypi:~/gpio-practice/3-userspace-c-version $ gcc -o gpiotest gpiotest.c
```
Run it:
```
pi@raspberrypi:~/gpio-practice/3-userspace-c-version $ sudo ./gpiotest
```



***4. Kernelspace loadable kernel module (LKM) C version - cross-compile it on PC:***

Download RPi kernel source and a cross-compiler on the dev PC. For more information check here:
https://www.raspberrypi.org/documentation/linux/kernel/building.md
"Cross-compiling" -> "Install toolchain" section and
"Cross-compiling" -> "Get sources" section
Should be put here:
~/gpio-practice/tools
and
here:
~/gpio-practice/linux

Add your path to the compiler:
```
export PATH=$PATH:~/gpio-practice/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
```
Build the kernel module (edit the Makefile if needed according to the paths to your compiler and linux sources you've downloaded):
```
user@devpc:~ $ cd gpio-practice/4-kernelspace-c-version/  
user@devpc:~/gpio-practice/4-kernelspace-c-version $ make
```
Upload the kernel module on the RPi via your network:
```
user@devpc:~/gpio-practice/4-kernelspace-c-version $ scp gpiotest.ko pi@192.168.xxx.yyy:~/gpio-practice/4-kernelspace-c-version
```
List the kernel modules running on the RPi if you like:
```
pi@raspberrypi:~/gpio-practice/4-kernelspace-c-version $ lsmod
```
Load your kernel module:
```
pi@raspberrypi:~/gpio-practice/4-kernelspace-c-version $ sudo insmod gpiotest.ko
```
Press the button and watch the LED.
Unload your kernel module:
```
pi@raspberrypi:~/gpio-practice/4-kernelspace-c-version $ sudo rmmod gpiotest
```



***5. Userspace C version by using mmap the SoC registers in a process's address space - compile it on RPi:***
```
pi@raspberrypi:~ $ cd gpio-practice/5-userspace-c-mmap-hackers-version/  
pi@raspberrypi:~/gpio-practice/5-userspace-c-mmap-hackers-version $ gcc -o gpiotest gpiotest.c
```
Run it:
```
pi@raspberrypi:~/gpio-practice/5-userspace-c-mmap-hackers-version $ sudo ./gpiotest
```


