#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e " ${green}1${NCT} Restart All Services"
echo -e " ${green}2${NCT} Restart OpenSSH"
echo -e " ${green}3${NCT} Restart Dropbear"
echo -e " ${green}4${NCT} Restart Stunnel4"
echo -e " ${green}5${NCT} Restart OpenVPN (off)"
echo -e " ${green}6${NCT} Restart Squid"
echo -e " ${green}7${NCT} Restart Nginx"
echo -e " ${green}8${NCT} Restart Badvpn"
echo -e " ${green}9${NCT} Restart XRAY"
echo -e " ${green}10${NCT} Restart WEBSOCKET"
echo -e " ${green}11${NCT} Restart Trojan Go (off)"
echo -e ""
echo -e " ${red}0${NCT} BACK TO MENU"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu : " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                # /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                echo -e "[ \033[32mok${NCT} ] Restarting xray Service (via systemctl) "
                sleep 0.5
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[32mok${NCT} ] Restarting badvpn Service (via systemctl) "
                sleep 0.5
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mok${NCT} ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] ALL Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                2)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] SSH Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                3)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/dropbear restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Dropbear Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                4)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/stunnel4 restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Stunnel4 Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                5)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/openvpn restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Openvpn Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/squid restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Squid Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                7)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                /etc/init.d/nginx restart
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Nginx Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                8)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok${NCT} ] Restarting badvpn Service (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Badvpn Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                9)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok${NCT} ] Restarting xray Service (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] XRAY Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                10)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok${NCT} ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] WEBSOCKET Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                11)
                clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}               RESTART MENU               ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo -e ""
                echo -e "[ \033[32mInfo${NCT} ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok${NCT} ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service
                sleep 0.5
                echo -e "[ \033[32mInfo${NCT} ] Trojan Go Service Restarted"
                echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;                                                                         
                0)
                m-system
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "Wrong Press!" ; sleep 1 ; restart ;;               
        esac
