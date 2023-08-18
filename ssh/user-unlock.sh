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
passwd -u $username
clear
  echo " "
  echo " "
  echo " "
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
  echo -e "Username ${blue}$username${NC} successfully ${green}UNLOCKED${NC}."
  echo -e "Access for Username ${blue}$username${NC} has been restored"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NCT}"
else
echo " "
echo -e "Username ${red}$username${NC} not found in your server."
echo " "    
	exit 1
fi
