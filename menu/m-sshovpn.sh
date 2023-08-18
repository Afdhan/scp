#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                 SSH MENU                 ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Create SSH & WS Account "
echo -e " ${green}2${NCT} Trial SSH & WS Account "
echo -e " ${green}3${NCT} Renew SSH & WS Account "
echo -e " ${green}4${NCT} Delete SSH & WS Account "
echo -e " ${green}5${NCT} Check User Login SSH & WS "
echo -e " ${green}6${NCT} List Member SSH & WS "
echo -e " ${green}7${NCT} Delete User Expired SSH & WS "
echo -e " ${green}8${NCT} Set up Autokill SSH "
echo -e " ${green}9${NCT} Cek Users Who Do Multi Login Multi"
echo -e " ${green}10${NCT} User list created Account "
echo -e " ${green}11${NCT} Change Banner SSH "
echo -e " ${green}12${NCT} Set Lock User "
echo -e " ${green}13${NCT} Set Unlock User "
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
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
10) clear ; cat /etc/log-create-ssh.log ; exit ;;
11) clear ; nano /etc/issue.net ; exit ;;
12) clear ; user-lock ; exit ;;
13) clear ; user-unlock ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Wrong Press!" ; sleep 1 ; m-sshovpn ;;
esac
