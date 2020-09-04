#! /bin/sh
# This file is for pulling updates to assignments from GitHub Classroom repositories
# It will go through each folder and pull updates
# It requires the folder name and a message


if [[ $# -ne 1 ]];
	then
	echo "This script requires 1 parameter."
	echo "1. The folder name the assignments are in"
else
	assignment=$1
	date=`date +%m-%d-%Y`
	time=`date +%H:%M:%S`
	for f in ../${assignment}/*
		do
			cd $f
			git pull
			echo $f
			cd ..
		done
fi
