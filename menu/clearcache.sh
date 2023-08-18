#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo ""
echo ""
echo -e "[ ${green}Info${NCT} ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ ${green}ok${NCT} ] Cache cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
