#!/bin/bash



#A file with the list of applications to remove
file="appList.list"


echo "" >> resultsremo.sh
echo "Start uninstall process!" >> resultsremo.sh
echo "" >> resultsremo.sh

echo "" 
echo "Start uninstall process!" 
echo "" 


while IFS= read line
do
	echo "" >> resultsremo.sh 
        # display line or do somthing with line
	
	echo "" >> resultsremo.sh
	echo "$line" >> resultsremo.sh
	echo "" >> resultsremo.sh

	#Check if application is already installed
	if hash $line 2>/dev/null; then


		
		echo "'$line' is installed >>> Now uninstalling!" >> resultsremo.sh
		echo ""

		sudo apt-get purge --auto-remove $line -y

		echo "'$line' is now uninstalled!" >> resultsremo.sh
		echo ""
		else 
		#Not installed 
		echo "'$line' not currently installed!" >> resultsremo.sh
		echo ""
	
	fi
	echo ""

done <"$file"

echo "" >> resultsremo.sh

#Upgrade package files
echo "Unused packages are being removed!" >> resultsremo.sh
echo "Unused packages are being removed!"
echo "" >> resultsremo.sh
echo ""

sudo apt-get upgrade -y

echo "Unused packages are now removed!" >> resultsremo.sh
echo "Unused packages are now removed!"
echo "" >> resultsremo.sh
echo ""




#Clean up unused package files
echo "Unused packages are being removed!" >> resultsremo.sh
echo "Unused packages are being removed!"
echo "" >> resultsremo.sh
echo ""

sudo apt-get clean -y

echo "Unused packages are now removed!" >> resultsremo.sh
echo "Unused packages are now removed!"
echo "" >> resultsremo.sh
echo ""

#Update Ubuntu
echo "Ubuntu is now being updated!" >> resultsremo.sh
echo "Ubuntu is now being updated!"
echo "" >> resultsremo.sh
echo ""

sudo apt-get update -y

echo "Ubuntu now updated!" >> resultsremo.sh
echo "Ubuntu now updated!"

echo "" >> resultsremo.sh
echo "Uninstall process is now complete!" >> resultsremo.sh
echo "" >> resultsremo.sh
echo "" 
echo "Uninstall process is now complete!" 
echo "" 

