#!/bin/bash
acc
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
clear
echo " "
echo " "
echo " "
read -p "Input USERNAME to unlock: " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
# proses mengganti passwordnya
passwd -u $username
clear
  echo " "
  echo " "
  echo " "
  echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "Username ${blue}$username${NC} successfully ${green}UNLOCKED${NC}."
  echo -e "Access for Username ${blue}$username${NC} has been restored"
  echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
else
echo " "
echo -e "Username ${red}$username${NC} not found in your server."
echo " "    
	exit 1
fi
