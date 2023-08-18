#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                DOMAIN MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "" 
echo -e " ${green}1${NCT} CHANGE DOMAIN VPS"
echo -e " ${green}2${NCT} RENEW CERTIFICATE DOMAIN"
echo -e ""
echo -e " ${red}0${NCT} BACK TO MENU${NCT}"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; m-system ;;
x) exit ;;
*) echo -e "Wrong Press!" ; sleep 1 ; m-domain ;;
esac
