#!/usr/bin/env python

from gpiozero import LED, Button
from time import sleep

led = LED(17)
button = Button(24)

while True:
	button.wait_for_press()
	led.on()
	sleep(2)
	led.off()
