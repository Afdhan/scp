#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
source /root/.warna.conf
clear

tls="$(cat ~/log-install.txt | grep -w "VMess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMess WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		if [[ $# -gt 0 ]]; then
        while getopts u:v: flag
        do
            case "${flag}" in
                u) user=${OPTARG};;
                v) masaaktif=${OPTARG};;
            esac
        done
        else 
            read -rp "User: " -e user
        fi
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' || ${CLIENT_EXISTS} == '2' ]]; then
clear
cat > /home/vps/public_html/json/${user}-vmess.json << END
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
# if [[ !$1 && !$2 ]]; then
# read -p "Expired (days): " masaaktif
# else
# masaaktif=$2
# fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
# if [[ $1 && $2 ]]; then
# cat << EOF
# {
#     "status": "success",
#     "message": "account created successfully",
#     "data": {
#         "username": "${user}",
#         "hostname": "${domain}",
#         "port_tls": "${tls}",
#         "port_ntls": "${none}",
#         "port_grpc": "${tls}",
#         "uuid": "${uuid}",
#         "path": "/vmess",
#         "servicename": "vmess-grpc",
#         "link_tls": "${vmesslink1}",
#         "link_ntls": "${vmesslink2}",
#         "link_grpc": "${vmesslink3}",
#         "exp": "${exp}"
#     }
# }
# EOF
# fi
cat > /home/vps/public_html/json/${user}-vmess.json << END
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
        "path": "/vmess",
        "servicename": "vmess-grpc",
        "link_tls": "${vmesslink1}",
        "link_ntls": "${vmesslink2}",
        "link_grpc": "${vmesslink3}",
        "exp": "${exp}"
    }
}
END
echo -e "SUCCESS"
exit 0