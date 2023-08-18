#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
               
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}         Dropbear User Login       ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo "ID  |  Username  |  IP Address";
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"

done
echo " "
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}          OpenSSH User Login       ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo "ID  |  Username  |  IP Address";
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"

done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo " "
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        echo -e "${LIGHT}          OpenVPN TCP User Login         ${NCT}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        echo "Username  |  IP Address  |  Connected Since";
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo " "
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        echo -e "${LIGHT}          OpenVPN UDP User Login         ${NCT}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        echo "Username  |  IP Address  |  Connected Since";
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo "";

rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
read -n 1 -s -r -p "Press any key to back on menu"

m-sshovpn
