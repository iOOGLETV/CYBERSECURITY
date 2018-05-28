#!/bin/bash
## David Autry
## INFSYS6858 - Advanced Cybersecurity Concepts
## harden.sh -- This script hardens the Ubuntu OS against attacks

echo "Downloading lists from repositories to obtain info about newest versions of packages and their dependencies..."
sudo apt-get -y update ## perform package list update  1

while true; do  ## give user option of upgrading packages
	read -p "Do you want to upgrade packages [Y/N]?" yn
	case $yn in
		[Yy]* ) sudo apt-get upgrade; break;;
		[Nn]* ) break;;
		* ) echo "Yes or No?";;
	esac
done

## Request a password change from the user to change their password   2
echo "Time to change your password."
passwd

## install a firewall   3,4
echo "Now installing a firewall and its graphical user interface..."
sudo apt-get -y install ufw 
sudo apt-get -y install gufw

## Run the frontend to ufw  5
echo "You may now configure the firewall."
sudo gufw &

## Install Lynis diagnostic security tool   6
echo "Now installing the lynis diagnostic security tool."
echo "At the command prompt, type 'sudo lynis audit system'"
sudo apt-get -y install lynis

## Install chkrootkit that can be used to check for root kits  7
echo "Now installing the root kit checking app 'checkrootkit'."
echo "This will be executed later when the diagnostic script is run."
sudo apt-get -y install chkrootkit

## Install nmap in order to run a port scan later in the diagnostic script  8
echo "Installing nmap to provide port scanning functionality."
sudo apt-get -y install nmap

## Install tiger, an intrustion detection tool  9
echo "Installing tiger, an intrusion detection tool."
sudo apt-get -y install tiger

#Check for telnet server - if so recommend ssh, kill the telnetd process, and remove the telnetd package  10, 11
pgrep "telnetd" && echo "The telnet server is running.  Killing the telnetd process.  It is stongly recommended to use the latest version of ssh instead." && kill pgrep "telnetd" && sudo apt-get -y remove telnetd || echo "Telnet service does not appear to be running."

#Install logwatch, a utility to simplify monitoring system logs  12
echo "Installing logwatch utility.  You will need to to talor the logwatch configure file to your specific system."
sude apt-get -y install logwatch

#install nikto, a utility to look for vunerabilities in a webserver 13
echo "Installing nikto.  Use this to scan for vunerabilities in a webserver, if you have one on your system."
sudo apt-get -y install nikto

#install nmap, used to scan for open ports and protocols being used 14
echo "Installing nmap.  Use this to scan for open ports on your system."
sudo apt-get -y install nmap

#install netstat, used to show active internet connections and sockets 15
echo "Installing nmap.  Use this to scan for open ports on your system."
sudo apt-get -y install nmap

echo -e "\nThe harden.sh script has completed execution."
## end of harden.sh script




 

















