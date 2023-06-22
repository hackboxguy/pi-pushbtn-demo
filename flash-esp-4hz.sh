#!/bin/sh

#start blinking built-in-LED on KEY_UP button to indicate that action is busy
sudo sh -c "echo timer > /sys/class/leds/statusled0/trigger"

#trigger esp8266 firmware flashing using esptool(4hz-blink-firmware)
esptool --port /dev/ttyUSB0 write_flash -fs 1MB -fm dout 0x0 /home/pi/pi-pushbtn-demo/firmware/wemos-d1-mini-blink-4hz.bin

if [ $? = "0" ]; then
	#after successfull flashing switch OFF the blinking LED
	sudo sh -c "echo gpio > /sys/class/leds/statusled0/trigger"
	sudo sh -c "echo 0 > /sys/class/leds/statusled0/brightness"
else
	#incase of failure, switch the blinking LED to solid-ON to indicate that there was an error
	sudo sh -c "echo gpio > /sys/class/leds/statusled0/trigger"
	sudo sh -c "echo 1 > /sys/class/leds/statusled0/brightness"
fi
