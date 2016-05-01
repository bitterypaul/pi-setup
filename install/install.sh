#!/bin/sh
sudo bash
apt-get update
apt-get install hostapd dnsmasq x11vnc xkbset aria2 pure-ftpd

# pre ad-blocker configs
cp dhcpcd.conf /etc/dhcpcd.conf
cp interfaces /etc/network/interfaces

cp hostapd.conf /etc/hostapd/hostapd.conf
mv /etc/default/hostapd /etc/default/hostapd.orig
cp hostapd /etc/default/hostapd

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
cp dnsmasq.conf /etc/dnsmasq.conf

mv /etc/sysctl.conf /etc/sysctl.conf.orig
cp sysctl.conf /etc/sysctl.conf

cp init.sh /home/pi/init.sh

cp rc.local /etc/rc.local
cp xsessionrc /home/pi/.xsessionrc

chmod 777 -R /home/pi

#ftp
groupadd ftpgroup
useradd ftpuser -g ftpgroup -s /sbin/nologin -d /dev/null
sudo mkdir /home/pi/FTP
sudo chown -R ftpuser:ftpgroup /home/pi/FTP
sudo pure-pw useradd upload -u ftpuser -g ftpgroup -d /home/pi/FTP -m
sudo pure-pw mkdb
ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb

#aria2

mkdir .aria2;
cp aria2.config /etc/.aria2/aria2.config
cp aria2 /etc/init.d/aria2
chmod 777 /etc/init.d/aria2
sudo update-rc.d aria2 defaults



rpi-update

curl -L install.pi-hole.net | bash 


service dnsmasq stop
rm /etc/dnsmasq.d/01-pihole.conf
cp dnsmasq.conf.post /etc/dnsmasq.conf
cp dhcpcd.conf.post /etc/dhcpcd.conf
