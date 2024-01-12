#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
source /root/.warna.conf
clear
source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do

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
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' || ${user_EXISTS} == '2' ]]; then
clear
cat > /home/vps/public_html/json/${user}-tr.json << END
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
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:${tls}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@isi_bug_disini:${ntls}?path=%2Ftrojan-ws&security=none&host=${domain}&type=ws#${user}"
systemctl restart xray
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
#         "port_ntls": "${ntls}",
#         "port_grpc": "${tls}",
#         "uuid": "${uuid}",
#         "path": "/trojan-ws",
#         "servicename": "trojan-grpc",
#         "link_tls": "${trojanlink}",
#         "link_ntls": "${trojanlink2}",
#         "link_grpc": "${trojanlink1}",
#         "exp": "${exp}"
#     }
# }
# EOF
# else
cat > /home/vps/public_html/json/${user}-tr.json << END
{
    "status": "success",
    "message": "account created successfully",
    "data": {
        "username": "${user}",
        "hostname": "${domain}",
        "port_tls": "${tls}",
        "port_ntls": "${ntls}",
        "port_grpc": "${tls}",
        "uuid": "${uuid}",
        "path": "/trojan-ws",
        "servicename": "trojan-grpc",
        "link_tls": "${trojanlink}",
        "link_ntls": "${trojanlink2}",
        "link_grpc": "${trojanlink1}",
        "exp": "${exp}"
    }
}
END
echo -e "SUCCESS"
exit 0
# fi
