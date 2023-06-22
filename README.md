# pi-pushbtn-demo
A Demo Configs and Scripts to show how to connect Rugged-Metal-Push-Buttons to Raspberry-Pi as a keyboard event device.

A Rugged Metal Push-Button has a built in LED-ring which can be controlled through a gpio pin to show the status of the action triggered by the push-button.

## Connection Diagram

![Connection Diagram.](/images/connection-diagram.png "Connection Diagram.")

## Demo Setup
1. Connect two push-buttons to raspberry-pi Gpio pins as shown above in the connection diagram
1. Using Raspberry-Pi-Imager, prepare a sdcard with Raspberry-Pi-OS-Lite(32-bit)
1. Using Ctrl+Shift+x, open advanced options menu on Raspberry-Pi-Imager, and set the user/pw/timezone/hostname/ssh-enable
1. Insert the sdcard and boot the raspberry pi by connecting it to local dhcp-server network
1. ssh to raspberry pi using ```ssh pi@my-raspi-001```
1. ```sudo apt-get install -y git```
1. ```git clone https://github.com/hackboxguy/pi-pushbtn-demo.git```
1. ```cd pi-pushbtn-demo```
1. ```sudo ./setup.sh```
1. ```sudo reboot```
1. After raspi-reboot, push the button and see that its LED blinks


## Links

Detailed Insturctions can be found at my [Blog](http://albert-david.blogspot.com/2023/06/interfacing-rugged-metal-push-button.html).
