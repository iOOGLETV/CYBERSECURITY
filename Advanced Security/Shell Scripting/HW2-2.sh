#!/bin/bash -i


output=$( bash <<EOF
echo "Hi, $USER!"
echo
echo
echo
echo "	$USER, in order to create the folders to hold your files, do as follow: "
echo
echo
echo "
		mkdir UMSL
		cd UMSL
		
		mkdir LNI
		cd LNI
		
		mkdir PROGRAM SCRIPTS FILES
		cd PROGRAM
		
		mkdir PYTHON C++
		cd ..
		cd SCRIPTS
		
		mkdir SHELL_BASH
		cd ..
		cd FILES"
		echo
		echo
		echo
echo "	Go to FILES in order to create the following 3 files:"
echo
echo
echo
echo "RUN A COMMAND THAT"
echo "RESULTS IN THE ENTIRE"
echo "HISTORY BEING PLACED"
echo "IN A HISTORY.HTML FILE."
echo "FILE PERMISSIONS"
echo "SHOULD BE -R--R--R--."
echo
rm history.html
history > history.html
sudo chmod 444 -R history.html
ls -l
echo
echo
echo "RUN A COMMAND THAT"
echo "RESULTS IN THE"
echo "SYSTEM'S INFORMATION"
echo "BEING PLACED IN A"
echo "SYSTEMINFO.HTML FILE."
echo "FILE PERMISSIONS"
echo "SHOULD BE -R--R--RWX."
echo
rm SYSTEMINFO.HTML
uname -a > SYSTEMINFO.HTML
chmod 447 -R SYSTEMINFO.HTML
ls -l
echo
echo
echo "RUN A COMMAND THAT RESULTS IN THE SYSTEM'S"
echo "INFORMATION BEING PLACED IN A SYSTEMINIFO.TXT FILE. YOU"
echo "SHOULD ENSURE THE FILE CONTAINS SYSTEM NAME, AND"
echo "MORE. FILE PERMISSIONS SHOULD BE -RW-RW-R--."
echo
uname -a > SYSTEMINFO.TXT
chmod 664 -R SYSTEMINFO.TXT
ls -l
echo
echo
echo
echo
echo "[uname -a, calendar, date, lsblk, select three other commands]"
echo
echo "Ensure you echo your name into file, spaces between commands ran"
echo "with descriptions of what will happen, and echo concluding statement"
echo "such as Script Complete"
echo
echo
echo "SYSTEM INFORMATION:"
uname -a
echo
echo
echo "CALENDAR"
cal
echo
echo
echo "DATE and TIME:" 
date
echo
echo
echo "LIST  OF INFORMATION ABOUT ALL AVAILABLE/SPECIFIED BLAOCK DEVICES ON THE SYSTEM:"
lsblk
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

echo "$output" > ResultsDiagHW2.sh

#end of file
