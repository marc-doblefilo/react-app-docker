#!/bin/bash

error_message() {
	echo -e "\n"
	echo -e "\e[1;31m[ ERROR ]\e[m React app not found. Check: https://github.com/mark-doblefilo/react-server-docker"
	echo -e "\n"
	exit 1
}

if [ -d "src" ]; then
	echo -e "\e[1;32m[ OK ]\e[m React app found. "
	npm start
else
	error_message
fi
