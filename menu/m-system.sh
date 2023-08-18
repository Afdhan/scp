#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                SYSTEM MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Domain Panel"
echo -e " ${green}2${NCT} Speedtest VPS"
echo -e " ${green}3${NCT} Set Auto Reboot"
echo -e " ${green}4${NCT} Restart All Service"
echo -e " ${green}5${NCT} Cek Bandwith"
echo -e " ${green}6${NCT} Install TCP BBR"
echo -e " ${green}7${NCT} DNS CHANGER"
echo -e " ${green}8${NCT} Update Menu"
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
1) clear ; m-domain ; exit ;;
2) clear ; speedtest ; exit ;;
3) clear ; auto-reboot ; exit ;;
4) clear ; restart ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; m-tcp ; exit ;;
7) clear ; m-dns ; exit ;;
7) clear ; update ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Wrong Press!" ; sleep 1 ; m-system ;;
esac
