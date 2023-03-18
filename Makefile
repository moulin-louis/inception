# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: loumouli <loumouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 10:25:58 by loumouli          #+#    #+#              #
#    Updated: 2023/03/11 10:28:41 by loumouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: clean user build

user:
	@sudo cp hosts /etc/hosts

build:
	mkdir -p /home/loumouli/data/db
	mkdir -p /home/loumouli/data/mariadb
	cd ./srcs/ && docker compose up --build

clean:
	@echo cleaning all docker related stuff
	@sudo rm -rf /home/loumouli/data
	@docker stop $$(docker ps -qa) > /dev/null 2> /dev/null ;\
	docker rm $$(docker ps -qa) > /dev/null 2> /dev/null;\
	docker rmi -f $$(docker images -qa) > /dev/null 2> /dev/null;\
	docker volume rm $$(docker volume ls -q) > /dev/null 2> /dev/null;\
	docker network prune -f > /dev/null 2> /dev/null;\

.PHONY: all clean user build
