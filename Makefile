# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: loumouli <loumouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 10:25:58 by loumouli          #+#    #+#              #
#    Updated: 2023/03/10 17:41:01 by loumouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: clean user build

user:
	echo "127.0.0.1 localhost loumouli.42.fr" > /etc/hots

build:
	mkdir -p /home/loumouli/data/db
	mkdir -p /home/loumouli/data/mariadb
	docker compose up --build

clean:
	@echo cleaning all docker related stuff
	@docker stop $$(docker ps -qa) > /dev/null 2> /dev/null ;\
	docker rm $$(docker ps -qa) > /dev/null 2> /dev/null;\
	docker rmi -f $$(docker images -qa) > /dev/null 2> /dev/null;\
	docker volume rm $$(docker volume ls -q) > /dev/null 2> /dev/null;\
	docker network prune -f > /dev/null 2> /dev/null;\

.PHONY: build all clean
