#!/bin/bash

echo "User: "
whoami

echo "Time: "
date

# Vimba paths
export GENICAM_GENTL32_PATH=":/home/logger/Vimba_2_1/VimbaGigETL/CTI/x86_32bit"
export GENICAM_GENTL64_PATH=":/home/logger/Vimba_2_1/VimbaGigETL/CTI/x86_64bit"

echo "Fix python paths"
export PATH="/home/logger/anaconda3/bin:/home/logger/bin:/home/logger/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/logger:$PATH"

echo "Sleep 1"
sleep 1

echo "Go!"
echo "-----"
value=`cat /home/logger/.dune-silcam.arg`
echo "Argument from dune silcam task:  $value"
if [ "$value" == "Acquire" ]; then
	echo "Starting SILCAM ACQUIRE"
	silcam acquire /mnt/DATA/config.ini /mnt/DATA/RAW/ --discwrite
elif [ "$value" == "Process" ]; then
	echo "Starting SILCAM PROCESS"
	silcam realtime /mnt/DATA/config.ini /mnt/DATA/RAW --appendstats
elif [ "$value" == "Both" ]; then
	echo "Starting SILCAM BOTH"
	silcam realtime /mnt/DATA/config.ini /mnt/DATA/RAW --discwrite --appendstats
else
	echo "Unknown argument in /home/logger/.dune-silcam.arg, defaults to Acquire"
	silcam acquire /mnt/DATA/config.ini /mnt/DATA/RAW/ --discwrite
fi
#silcam acquire /mnt/DATA/config.ini /mnt/DATA/RAW/ --discwrite
#silcam realtime /mnt/DATA/config.ini /mnt/DATA/RAW --appendstats
#silcam realtime /mnt/DATA/config.ini /mnt/DATA/RAW --discwrite --appendstats

#> /mnt/DATA/SERVICELOG.log
