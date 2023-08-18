#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo ""
read -rp "Add Subdomain : " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
read -n 1 -s -r -p "Press any key to back on menu"
m-domain
else
echo "IP=$host" > /var/lib/ipvps.conf
echo "$host" > /root/domain
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-domain
fi
