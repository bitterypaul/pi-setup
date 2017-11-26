#!/bin/sh

exec 2> /dev/null
exec 1>&2

sudo sh /home/pi/scripts/allow_internet_access.sh
#sudo sh /home/pi/scripts/port_forward.sh

sudo sh /home/pi/scripts/ddns.sh &
sudo aria2c --conf-path=/home/pi/.aria2/aria2.conf &

#cd /home/pi/scripts/py
sleep 8
sudo service dnsmasq restart
###################################################################################

sudo sh /home/pi/scripts/server.sh &

sudo sh /home/pi/scripts/custom_server.sh &
#cd /home/pi/scripts/py



#python SimpleAuthServer.py 1350 piselfie:pipassportsz > /dev/null 2>&1
##sudo -u pi /opt/syncthing/syncthing -gui-address="192.160.1.1:8000" &


#sudo mount /dev/sda1 /media/usb -o uid=pi,gid=pi
sudo mount -t ext4 -o defaults /dev/sda1 /home/pi/Downloads/SONY

exit 0
