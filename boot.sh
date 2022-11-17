!/bin/bash
xscreensaver -no-splash &
#@xset s off
xset -dpms
xset s noblank

matchbox-window-manager -use_titlebar no &
unclutter &    # hide X mouse cursor unless mouse activated

./home/pi/pi-kiosk-install/screensaver.sh &

# Remove exit errors from the config files that could trigger a warning

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

sleep 5

x=`ping -c1 google.com 2>&1 | grep failure`
if [ ! -z "$x" ]; then
wpa_gui
fi

chromium-browser --kiosk --disable-restore-session-state --disable-session-crashed-bubble --check-for-update-interval=31536000 --noerrordialogs --disable-infobars https://trowepricesurvey.com -incognito