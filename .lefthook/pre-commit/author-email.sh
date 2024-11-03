#!/bin/sh

RED=$'\e[0;31m'
YELLOW=$'\e[0;33m'

allowed_email_domains=(gmail.com)
author_email=${GIT_AUTHOR_EMAIL#*@}

if [[ " ${allowed_email_domains[*]} " =~ " ${author_email} " ]]; then
	exit 0
else
	echo "${RED}Allowed email domains are ${allowed_email_domains[*]}"
	echo "${YELLOW}Example: john.doe@gmail.com" 
	echo
	echo "Fix your email by using:"
	echo "git config user.email YOUR_EMAIL"
	echo "Then try commiting again"
	
	exit 1
fi
