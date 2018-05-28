#!/bin/bash
#Author - David Autry
#INFSYS 6858 - Advanced Cybersecurity Concepts
#09/08/2017
#This scripts removes the 5 applications installed by the Install.sh script

sudo apt-get purge -y nikto wireshark r-base rkward gufw

echo -e "\nScript execution completed."


