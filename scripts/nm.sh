#!/bin/bash
wpa_cli scan
sleep 10
networks=$(wpa_cli scan_results | tail -n+3 | awk -F '\t' '{print $(NF)}')
profiles=$(ls -p /etc/netctl | grep -v "/")
counter=0
ssids=""
for profile in $profiles
do
##		echo "$profile"
		ssids="$ssids" $(cat /etc/netctl/"$profile" | grep ESSID | awk -F "'" '{print $(NF-1)}')
	counter=`expr $counter + 1`
done
for ssid in "$ssids"
do
	echo "$ssid"
done
#for network in "$networks"
#do
##		echo network
#done
	
