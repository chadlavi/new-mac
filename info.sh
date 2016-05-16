#!/bin/bash
echo "getting info on current brewlist... "
date=$(date "+%Y%m%d")
for app in $(cat brewlist); do 
	brew info $app | sed -n 1,2p >> $date-formula-info
	echo "" >> $date-formula-info
done
echo "done."
