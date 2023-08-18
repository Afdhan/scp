#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}             SHADOWSOCKS MENU             ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Create Account Shadowsocks "
echo -e " ${green}2${NCT} Create Trial Shadowsocks "
echo -e " ${green}3${NCT} Extending Account Shadowsocks "
echo -e " ${green}4${NCT} Delete Account Shadowsocks "
echo -e " ${green}5${NCT} User list created Account "
echo -e ""
echo -e " [\e[31m•0${NCT} \e[31mBACK TO MENU${NCT}"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ssws ;;
2) clear ; trialssws ;;
3) clear ; renew-ssws ;;
4) clear ; del-ssws ;;
5) clear ; cat /etc/log-create-shadowsocks.log ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Wrong Press!n" ; sleep 1 ; m-ssws ;;
esac
