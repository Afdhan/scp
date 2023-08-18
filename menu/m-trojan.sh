#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                TROJAN MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Create Account Trojan "
echo -e " ${green}2${NCT} Trial Account Trojan "
echo -e " ${green}3${NCT} Extending Account Trojan "
echo -e " ${green}4${NCT} Delete Account Trojan "
echo -e " ${green}5${NCT} Check User Login Trojan "
echo -e " ${green}6${NCT} User list created Account "
echo -e ""
echo -e " ${red}0${NCT} BACK TO MENU${NCT}"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; cat /etc/log-create-trojan.log ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Wrong Press!" ; sleep 1 ; m-trojan ;;
esac
