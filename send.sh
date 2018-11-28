#!/bin/bash 
# make sure that only one instance of the plugin is concurrently accessing the sender
while [ -f /home/pi/433Utils/RPi_utils/lock  ]; do
    echo "locked"
    sleep 0.5
done
COUNTER=0
touch /home/pi/433Utils/RPi_utils/lock
# repeat the command to make triple sure it reaches the switch
while [  $COUNTER -lt 3 ]; do
    /home/pi/433Utils/RPi_utils/codesend $1
    let COUNTER=COUNTER+1
done
rm /home/pi/433Utils/RPi_utils/lock

