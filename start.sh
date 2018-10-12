#!/bin/sh

while [ true ] ; do 
	echo $HELLO
	date
	echo $HELLO >> /tmp/date.log
	date >> /tmp/date.log
	sleep 1;
done
