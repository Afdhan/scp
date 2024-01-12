#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#&#' | cut -d ' ' -f 2`);
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}";
echo -e "${LIGHT}               TROJAN LOGIN               ${NCT}";
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="Not Found"
fi
echo -n > /tmp/iptrojan.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | nl)
echo "User : $akun";
echo "$jum2";
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
fi
rm -rf /tmp/iptrojan.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "Other :";
echo "$oth";
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo ""
rm -rf /tmp/other.txt
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
