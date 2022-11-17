!/bin/bash

# aliases
echo "alias ll='ls -al'" >> /home/pi/.bashrc
echo "alias kon='mv /home/pi/.config/lxsession/LXDE-pi/autostart_off /home/pi/.config/lxsession/LXDE-pi/autostart && sudo reboot'" >> /home/pi/.bashrc
echo "alias koff='mv /home/pi/.config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart_off && sudo reboot'" >> /home/pi/.bashrc
echo "alias won='sudo cp /etc/wpa_supplicant/wpa_supplicant.conf_on /etc/wpa_supplicant/wpa_supplicant.conf" >> /home/pi/.bashrc
echo "alias woff='sudo cp /etc/wpa_supplicant/wpa_supplicant.conf_off /etc/wpa_supplicant/wpa_supplicant.conf" >> /home/pi/.bashrc

# sudo apt update
# sudo apt upgrade -y
# kiosk
sudo mkdir -p /home/pi/.config/lxsession/LXDE-pi
sudo echo "sh /home/pi/pi-kiosk-install/boot.sh" > /home/pi/.config/lxsession/LXDE-pi/autostart

# screensaver
# sudo apt-get install xscreensaver -y

# resolution, HDMI and rotation
sudo cp ./config.txt /boot/config.txt

# wifi
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf_on
sudo apt-get install wpa_gui -y

# splash
sudo echo "logo.nologo" >> /boot/cmdline.txt
sudo cp ./splash.png /usr/share/plymouth/themes/pix/splash.png