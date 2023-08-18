#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                DNS CHECKER               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e ""
echo -e "Active DNS : $udns"
fi
echo -e ""
echo -e " ${green}1${NCT} CHANGE DNS"
echo -e " ${green}2${NCT} Reset DNS To Default"
echo -e ""
echo -e "${red} 0 BACK TO MENU ${NCT}"
echo -e ""
read -p "Select From Options [ 1 - 2 ] or 0 Back To Menu :  " dns
echo -e ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
case $dns in
1)
clear
echo ""
read -p "Please Insert DNS : " dns1
if [ -z $dns1 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
rm /etc/resolvconf/resolv.conf.d/head
touch /etc/resolv.conf
touch /etc/resolvconf/resolv.conf.d/head
echo "$dns1" > /root/dns
echo "nameserver $dns1" >> /etc/resolv.conf
echo "nameserver $dns1" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns1 sucessfully insert in VPS${NCT}"
echo ""
cat /etc/resolvconf/resolv.conf.d/head
sleep 1
clear
dns
;;
2)
clear
echo ""
read -p "Reset To Default DNS [Y/N]: " -e answer
if [ "$answer" = 'y' ] || [ "$answer" = 'Y' ]; then
rm /root/dns
echo ""
echo -e "[ ${GREEN}INFO${NC} ] Delete Resolv.conf DNS"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Delete Resolv.conf.d/head DNS"
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 1
else if [ "$answer" = 'n' ] || [ "$answer" = 'N' ]; then
echo -e ""
echo -e "[ ${GREEN}INFO${NC} ]  Operation Cancelled By User"
sleep 1
fi
fi
clear
dns
;;
0)
clear
m-system
;;
*)
echo -e "Wrong Press!"
clear
dns
;;
esac
