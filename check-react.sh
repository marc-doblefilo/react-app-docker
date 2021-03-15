#!/bin/bash

package='create-react-app'
response='n'

error_react_not_found() {
	echo -e "\n"
	echo -e "\e[1;31m[ ERROR ]\e[m React app not found. Check: https://github.com/mark-doblefilo/react-server-docker"
	echo -e "\n"
	ask_create_react
}

main() {
	if [ -d "src" ]; then
		echo -e "\e[1;32m[ OK ]\e[m React app found. "
		npm start
	else
		error_react_not_found
	fi
}

ask_create_react() {
	read -r -p "Do you want to create a React App? [y/N] " response
	if [[ $response == "y" || $response == "Y" || $response == "yes" || $response == "Yes"  ]]
	then
		check_package
	else
		exit 1	
	fi
}

check_package() {
	if [`npm list -g | grep -c $package` -eq 1 -o ! -d node_modul -o ! -d node_module ]; then
		echo -e "create-react-app not found. "
		exit 1	
	else
		echo -e "\e[1;32m[ OK ]\e[m create-react-app package found. "
		create_react_app
	fi
}

create_react_app() {
	echo "Working"
}

main
