#!/bin/bash

i="1"
reset

while [ $i -le 10 ]
do
	echo " "
	echo "              |======================================================="
	echo "              |                        Run $i                         "
	echo "              |======================================================="
	echo " "
	
	make run
	i=$[$i+1]

done
