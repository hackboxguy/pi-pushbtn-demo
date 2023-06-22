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
1. ```sudo apt-get install -y git esptool```
1. ```git clone https://github.com/hackboxguy/pi-pushbtn-demo.git```
1. ```cd pi-pushbtn-demo```
1. ```sudo ./setup.sh```
1. ```sudo reboot```
1. After raspi-reboot, push the buttons and see that its LED blinks and the state of the ACT-LED of Raspberry-PI changes its state

## How to extend this demo to trigger different firmware flashing on wemos-d1-mini based on the button-pressed?
After following all **11** steps as documented above, you could just overwrite **key-pressed-down.sh** and **key-pressed-up.sh** with **flash-esp-1hz.sh** and **flash-esp-4hz.sh** as shown below
```
cp /home/pi/pi-pushbtn-demo/flash-esp-1hz.sh /home/pi/pi-pushbtn-demo/key-pressed-down.sh
cp /home/pi/pi-pushbtn-demo/flash-esp-4hz.sh /home/pi/pi-pushbtn-demo/key-pressed-up.sh
``` 
Connect the wemos-d1-mini to USB port of raspberry-PI and push one of the buttons and notice that the flashing of wemos-d1-mini starts, and after flashing the firmware, blue LED on wemos-d1-mini would blink at different rate depending on the button which was pressed

![wemos-d1-mini-setup.](/images/wemos-d1-mini-setup.jpg "wemos-d1-mini-setup.")

## Links

Detailed Insturctions can be found at my [Blog](http://albert-david.blogspot.com/2023/06/interfacing-rugged-metal-push-button.html).
