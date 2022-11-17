!/bin/bash

# aliases
echo "alias ll='ls -al'" >> /home/pi/.bashrc
echo "alias kon='ls -al'" >> /home/pi/.bashrc
echo "alias koff='ls -al'" >> /home/pi/.bashrc
echo "alias won='ls -al'" >> /home/pi/.bashrc
echo "alias woff='ls -al'" >> /home/pi/.bashrc

sudo apt upgrade -y
# kiosk
sudo mkdir -p /home/pi/.config/lxsession/LXDE-pi
sudo echo "sh /home/pi/pi-kiosk-install/boot.sh" > /home/pi/.config/lxsession/LXDE-pi/autostart

# screensaver
sudo apt install xscreensaver

# resolution, HDMI and rotation
sudo cp ./config.txt /boot/config.txt

# wifi
sudo cp /etc/wpa_
sudo apt install wpa_gui

# splash
sudo echo "logo.nologo" >> /boot/cmdline.txt
sudo cp ./splash.png /usr/share/plymouth/themes/pix/splash.png