#!/bin/bash
#Author - David Autry
#INFSYS 6858 - Advanced Cybersecurity Concepts
#09/08/2017
#This scripts installs 5 applications

sudo apt-get -y update
sudo apt-get upgrade -y

sudo apt-get install -y nikto wireshark r-base rkward gufw

echo -e "\nScript execution completed."

