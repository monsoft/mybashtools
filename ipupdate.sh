#!/bin/bash

# No-IP DDNS host update
# by Irek 'Monsoft' Pelech
# (c) 2015 http://www.adminondemand.co.uk

# You can use different url to check your external IP address
# EXT_IP=$(wget -T 5 -qO- http://checkip.dyndns.org | sed -e 's/^.*Current IP Address: //g' -e 's/<.*$//g')
# EXT_IP=$(wget -T 5 -qO- icanhazip.com)	

NO_IP_USER="user"					# No-IP username
NO_IP_PASS="password"					# No-IP password
NO_IP_HOST="host.domain"				# host to update



EXT_IP=$(wget -T 5 -qO- dynupdate.no-ip.com/ip.php)	
if [[ ! "$EXT_IP" =~ ^([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})$ ]]; then
	echo "Can't get external IP address :("
	exit 1
fi

NO_IP_STATUS=$(curl -m 5 -s "http://$NO_IP_USER:$NO_IP_PASS@dynupdate.no-ip.com/nic/update?hostname=$NO_IP_HOST&myip=$EXT_IP")

echo "Host $NO_IP_HOST update $(echo "$NO_IP_STATUS"|egrep -i "good|nochg" >> /dev/null && { echo -e "\e[00;32mOK\e[00m"; } || { echo -e "\e[00;31mFail\e[00m"; })"
