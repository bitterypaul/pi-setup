#!/bin/sh
sudo bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  

sudo service hostapd stop
sudo service dnsmasq stop

sudo service hostapd start  
sudo service dnsmasq start


