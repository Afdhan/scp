#!/bin/bash
MYIP=$(curl -sS ifconfig.me)
acc
source /root/.warna.conf
domain=$(cat /etc/xray/domain)

modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi

uptime="$(uptime -p | cut -d " " -f 2-10)"

dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# user
Exp2=( `cat /root/.info | grep -E "$MYIP" | awk '{print $3}'` )
Name=( `cat /root/.info | grep -E "$MYIP" | awk '{print $2}'` )

cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ifconfig.me )
LOC=$(curl -s ifconfig.co/country )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                 VPS  INFO                ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${cyan} OS            ${NCT}: "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "${cyan} Uptime        ${NCT}: $uptime"
echo -e "${cyan} Public IP     ${NCT}: $IPVPS"
echo -e "${cyan} Country       ${NCT}: $LOC"
echo -e "${cyan} DOMAIN        ${NCT}: $domain"	
echo -e "${cyan} DATE & TIME   ${NCT}: $DATE2"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                 RAM  INFO                ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e "${cyan} RAM USED   ${NCT}: $uram MB"	
echo -e "${cyan} RAM TOTAL  ${NCT}: $tram MB"
echo -e ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                    MENU                  ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e   ""
echo -e "${cyan} 1 ${NCT}: SSH Menu"
echo -e "${cyan} 2 ${NCT}: VMess Menu"
echo -e "${cyan} 3 ${NCT}: VLess Menu"
echo -e "${cyan} 4 ${NCT}: Trojan Menu"
echo -e "${cyan} 5 ${NCT}: Shadowsocks Menu"
echo -e "${cyan} 6 ${NCT}: System Menu"
echo -e "${cyan} 7 ${NCT}: Service Status"
echo -e "${cyan} 8 ${NCT}: Clear RAM Cache"
echo -e "${cyan} 9 ${NCT}: Reboot VPS"
echo -e "${cyan} x ${NCT}: Exit Script"
echo -e   ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${cyan} Client Name ${NCT}: $Name"
echo -e "${cyan} Expired     ${NCT}: $Exp2"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-system ;;
7) clear ; running ;;
8) clear ; clearcache ;;
9) clear ; reboot ;;
x) exit ;;
*) echo "Wrong Press!" ; sleep 1 ; menu ;;
esac
