#!/bin/bash
##my script####
################
# КОНФИГУРАЦИЯ #
################

#Занулим на всāкий слуùай суперблоки
mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}

#Создаем рейд 0
mdadm --create --verbose /dev/md0 -l 0 -n 5 /dev/sd{b,c,d,e,f}


#создаем файл конфигурации
mkdir /etc/mdadm/
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
