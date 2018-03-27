#!/bin/bash
wpa_cli scan
sleep 2
networks=$(wpa_cli scan_results | tail -n+3 | awk -F '\t' '{print $(NF)}')
declare -A profiles
profiles=
counter=0
for profile in $(ls -p  /etc/netctl | grep -v "/")
do
	while IFS= read -r line
	do
		if [[ `expr match "$line" "ESSID=*"` -gt 0 ]]; then
			ssid=$(echo "$line" | awk -F '=' '{print $2}' | sed "s/'//g")
			profiles["$profile"]="$ssid"
			#ssids[counter]=$ssid
			#counter=`expr $counter + 1`
		fi
	done <"/etc/netctl/$profile"	
done

for profile in "${!profiles[@]}"
do
	for network in ${networks[@]}
	do
		if [[ "${profiles[$profile]}" = "$network" ]]; then
			echo "Matching: $ssid, ${profiles[$profile]}, $network"
			netctl switch-to $profile
			exit
		fi
	done
done
	
netctl stop-all
