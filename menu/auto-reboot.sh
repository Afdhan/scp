#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
acc
source /root/.warna.conf
clear
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}             AUTO-REBOOT MENU             ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
echo -e "${GREEN} 1 ${NCT} Set Auto-Reboot Every 1 Hour"
echo -e "${GREEN} 2 ${NCT} Set Auto-Reboot Every 6 Hour"
echo -e "${GREEN} 3 ${NCT} Set Auto-Reboot Every 12 Hour"
echo -e "${GREEN} 4 ${NCT} Set Auto-Reboot Every 1 Day"
echo -e "${GREEN} 5 ${NCT} Set Auto-Reboot Every 1 Week"
echo -e "${GREEN} 6 ${NCT} Set Auto-Reboot Every 1 Month"
echo -e "${GREEN} 7 ${NCT} Turn Off Auto-Reboot"
echo -e "${GREEN} 8 ${NCT} View Reboot Log"
echo -e "${GREEN} 9 ${NCT} Remove Reboot Log"
echo -e ""
echo -e "${GREEN} 0 ${NCT} Back To Menu"
echo -e ""
echo -e "${red} Press x or [ Ctrl+C ] To-Exit ${NCT}"
echo -e ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""
read -p " Select menu : " x
if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
elif test $x -eq 6; then
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
elif test $x -eq 7; then
rm -f /etc/cron.d/reboot_otomatis
echo "Auto-Reboot successfully TURNED OFF."
elif test $x -eq 8; then
if [ ! -e /root/log-reboot.txt ]; then
	clear
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo -e "${LIGHT}                  AUTO-REBOOT LOG                 ${NCT}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo -e ""
    echo " ${red}No reboot activity found ${NCT}"
    echo -e ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot
	else
	clear
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo -e "${LIGHT}                   AUTO-REBOOT LOG         	   ${NCT}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo -e ""    
	echo ' LOG REBOOT ${NCT}'
	cat /root/log-reboot.txt
    echo -e ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot    
fi
elif test $x -eq 9; then
clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e "${LIGHT}                  AUTO-REBOOT LOG                 ${NCT}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo -e ""  
echo "" > /root/log-reboot.txt
echo "${green} Auto Reboot Log successfully deleted! ${NCT}"
echo -e ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot 
elif test $x -eq 0; then
clear
m-system
else
clear
echo ""
echo "Options Not Found In Menu"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot 
fi
