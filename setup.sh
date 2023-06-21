#!/bin/sh
if [ $(id -u) -ne 0 ]; then
	echo "Please run setup as root ==> sudo ./setup.sh"
	exit
fi

printf "updating /boot/config.txt .................................................. "
echo "#map pi's gpio to /dev/input/eventX" >> /boot/config.txt
echo "dtoverlay=gpio-key,gpio=15,active_low=0,gpio_pull=down,label=enter,keycode=103 #KEY_UP" >> /boot/config.txt
echo "dtoverlay=gpio-key,gpio=23,active_low=0,gpio_pull=down,label=enter,keycode=108 #KEY_DOWN" >> /boot/config.txt
echo "#map pi's gpio as led" >> /boot/config.txt
echo "dtoverlay=gpio-led,gpio=14,active_low=0,trigger=none,label=statusled0 #/sys/class/leds/statusled0/brightness" >> /boot/config.txt
echo "dtoverlay=gpio-led,gpio=18,active_low=0,trigger=none,label=statusled1 #/sys/class/leds/statusled1/brightness" >> /boot/config.txt
test 0 -eq $? && echo "[OK]" || echo "[FAIL]"

printf "updating /etc/triggerhappy/triggers.d/...................................... "
echo "KEY_UP      0   /home/pi/pi-pushbtn-demo/key-pressed-up.sh" > /etc/triggerhappy/triggers.d/push-buttons.conf
echo "KEY_DOWN    0   /home/pi/pi-pushbtn-demo/key-pressed-down.sh" >> /etc/triggerhappy/triggers.d/push-buttons.conf
test 0 -eq $? && echo "[OK]" || echo "[FAIL]"

printf "updating /etc/systemd/system/multi-user.target.wants/triggerhappy.service... "
sed -i 's/nobody/pi/g' /etc/systemd/system/multi-user.target.wants/triggerhappy.service
test 0 -eq $? && echo "[OK]" || echo "[FAIL]"
printf "pi-pushbtn-demo has been installed successfully, reboot raspi............... "
