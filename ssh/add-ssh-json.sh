#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
# echo "Checking VPS"
sldomain=$(cat /root/nsdomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

if [[ !$1 ]]; then
    read -p "Username : " Login
else
    Login=$1
fi

if [[ !$2 ]]; then
    read -p "Password : " Pass
else
    Pass=$2
fi

if [[ !$3 ]]; then
    read -p "Expired (days): " masaaktif
else
    masaaktif=$3
fi

IP=$(curl -sS ifconfig.me);
# ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"

# OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
# OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
# OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

pkill sldns-server
pkill sldns-client
systemctl daemon-reload
systemctl stop client-sldns
systemctl stop server-sldns
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ $1 && $2 && $3 ]]; then
cat << EOF
{
    "status": "success",
    "message": "account created successfully",
    "data": {
        "ip_address": "${IP}",
        "username": "${Login}",
        "password": "${Pass}",
        "hostname": "${domen}",
        "port_openssh": "${opensh}",
        "port_dropbear": "${db}",
        "port_ssl": "${ssl}",
        "port_ws": "${portsshws}",
        "port_wsssl": "${wsssl}",
        "port_ns": "22, 443, 143",
        "ns": "${sldomain}",
        "pubkey": "${slkey}",
        "udp_custom": "1-65350",
        "udpgw": "7100-7900",
        "squid": "${sqd}",
        "payload_wss": "GET wss://isi_bug_disini HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]",
        "payload_ws": "GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]",
        "exp": "${exp}"
    }
}
EOF
fi
cat > /home/vps/public_html/json/${user}-ssh.json << END
{
    "status": "success",
    "message": "account created successfully",
    "data": {
        "ip_address": "${IP}",
        "username": "${Login}",
        "password": "${Pass}",
        "hostname": "${domen}",
        "port_openssh": "${opensh}",
        "port_dropbear": "${db}",
        "port_ssl": "${ssl}",
        "port_ws": "${portsshws}",
        "port_wsssl": "${wsssl}",
        "port_ns": "22, 443, 143",
        "ns": "${sldomain}",
        "pubkey": "${slkey}",
        "udp_custom": "1-65350",
        "udpgw": "7100-7900",
        "squid": "${sqd}",
        "payload_wss": "GET wss://isi_bug_disini HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]",
        "payload_ws": "GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]",
        "exp": "${exp}"
    }
}
END
echo -e "SUCCESS"
exit 0