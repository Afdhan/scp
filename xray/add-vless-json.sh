#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "VLess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VLess WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do

		if [[ !$1 ]]; then
		read -rp "User: " -e user
        else
        user=$1
        fi
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' || ${user_EXISTS} == '2' ]]; then
clear
	cat > /home/vps/public_html/json/${user}-vless.json << END
{
    "status": "error",
    "message": "username already used",
    "data": ""
}
END
			echo "ALREADY"
            exit 1
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
if [[ !$2 ]]; then
read -p "Expired (days): " masaaktif
else
masaaktif=$2
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
if [[ $1 || $2 ]]; then
cat << EOF
{
    "status": "success",
    "message": "account created successfully",
    "data": {
        "username": "${user}",
        "hostname": "${domain}",
        "port_tls": "${tls}",
        "port_ntls": "${none}",
        "port_grpc": "${tls}",
        "uuid": "${uuid}",
        "path": "/vless",
        "servicename": "vless-grpc",
        "link_tls": "${vlesslink1}",
        "link_ntls": "${vlesslink2}",
        "link_grpc": "${vlesslink3}",
        "exp": "${exp}"
    }
}
EOF
else
cat > /home/vps/public_html/json/${user}-vless.json << END
{
    "status": "success",
    "message": "account created successfully",
    "data": {
        "username": "${user}",
        "hostname": "${domain}",
        "port_tls": "${tls}",
        "port_ntls": "${none}",
        "port_grpc": "${tls}",
        "uuid": "${uuid}",
        "path": "/vless",
        "servicename": "vless-grpc",
        "link_tls": "${vlesslink1}",
        "link_ntls": "${vlesslink2}",
        "link_grpc": "${vlesslink3}",
        "exp": "${exp}"
    }
}
END
echo -e "SUCCESS"
exit 0