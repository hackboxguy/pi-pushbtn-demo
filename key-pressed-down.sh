#!/bin/sh

#re-purpose ACT LED to manually controlled led(instead of showing mmc0 activity)
sudo sh -c "echo gpio > /sys/class/leds/ACT/trigger"

#switch off blinking LED on other(KEY_UP) button
sudo sh -c "echo gpio > /sys/class/leds/statusled0/trigger"

#start blinking built-in-LED of KEY_DOWN button
sudo sh -c "echo timer > /sys/class/leds/statusled1/trigger"

#switch OFF ACT led to indicate that KEY_DOWN button handler has been invoked
sudo sh -c "echo 0 > /sys/class/leds/ACT/brightness"
