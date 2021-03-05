IMAGE_NAME := react-server-docker
SERVICE_NAME := react-dev
.PHONY: dev devstop
SHELL=/bin/bash

ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

build:
	@docker-compose build
	@echo -e "\n\n"
	@echo "${RED}${IMAGE_NAME}${RESET} is ${GREEN}BUILT${RESET}."

dev:
	@docker-compose up -d --build
	@echo -e "\n\n"
	@echo -e "\e[0;41m[DEV]\e[0m ${RED}${IMAGE_NAME}${RESET} is ${GREEN}up${RESET}. Try it: ${GREEN}localhost:3005${RESET}"

stopdev:
	@docker-compose stop ${SERVICE_NAME}
	@echo -e "\n\n"
	@echo -e "\e[0;41m[DEV]\e[0m ${RED}${IMAGE_NAME}${RESET} is ${RED}down${RESET}."