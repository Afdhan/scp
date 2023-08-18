#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "\E[45;1;30m                VLESS MENU                ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Create Account Vless "
echo -e " ${green}2${NCT} Trial Account Vless "
echo -e " ${green}3${NCT} Extending Account Vless "
echo -e " ${green}4${NCT} Delete Account Vless "
echo -e " ${green}5${NCT} Check User Login Vless "
echo -e " ${green}6${NCT} User list created Account "
echo -e ""
echo -e " ${red}0${NCT} \e[31mBACK TO MENU${NCT}"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-vless ; exit ;;
2) clear ; trialvless ; exit ;;
3) clear ; renew-vless ; exit ;;
4) clear ; del-vless ; exit ;;
5) clear ; cek-vless ; exit ;;
6) clear ; cat /etc/log-create-vless.log ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Wrong Press!" ; sleep 1 ; m-sshovpn ;;
esac
