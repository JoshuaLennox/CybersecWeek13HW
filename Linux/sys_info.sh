#!/bin/bash

echo "System Audit Script"
echo "Running on "
date

echo "Machine Type Info: "
echo $MACHTYPE

echo "Uname info is: "
uname -a

echo "IP info is: "
ifconfig enp0s3 | grep inet | grep -v inet6

echo "Hostname $(hostname -s) "
