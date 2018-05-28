#!/bin/bash


output=$( bash <<EOF
echo "Hi, $USER!"
echo
echo
echo
echo

history > history.html
chmod 444 -R history.html
ls -l

echo
echo
echo "IP Address:  "
hostname -I
echo
echo
echo "MAC Address:  "
cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address
echo
echo
echo "System Machine Name:  "
hostname
echo
echo
echo "Type of Kernal:  "
uname
echo
echo
echo "Current Date:  "
date +'%m-%d-%Y'
echo
echo
echo "LM Sensors:  "
sensors
echo
echo
echo "History of CHMOD Commands used on Machine:  "
history | grep chmod
echo
echo
echo "History of ls -l Commands used on Machine:  "
history | grep 'ls -l'
echo
echo
echo "Installed Packages:  "
apt-cache pkgnames | less
echo
echo
echo "Current Machine Processes:  "
ps aux | less
echo
echo
echo "Open Ports on Machine:  "
netstat -l
echo
echo
echo "Open TCP Port Connections:  "
netstat -vatn
echo
echo
echo "Open UDP Ports:  "
netstat -vaun
echo
echo
echo "Open FQDN (Full DNS Hostname) Ports:  "
netstat -vat
echo 
echo
echo
EOF
)

echo "$output" > ResultsDiag.sh

#end of file
