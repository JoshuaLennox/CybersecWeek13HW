#!/bin/bash

#Prints the amount of free memory on the system and saves the output
free > ~/backups/freemem/free_mem.txt

#Prints disk usage and saves the output
du -h > ~/backups/diskuse/disk_use.txt

#Lists all open files and saves the output
lsof > ~/backups/openlist/open_list.txt

#Prints file system disk space statistics and saves the output
df -h > ~/backups/freedisk/free_disk.txt


