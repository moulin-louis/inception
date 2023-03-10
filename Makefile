# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: loumouli <loumouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 10:25:58 by loumouli          #+#    #+#              #
#    Updated: 2023/03/10 15:59:17 by loumouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: clean build

build:
	mkdir -p /home/loumouli/data/db
	mkdir -p /home/loumouli/data/mariadb
	docker compose up --build

clean:
	@echo cleaning all docker related stuff
	@docker stop $$(docker ps -qa) > /dev/null;\
	docker rm $$(docker ps -qa) > /dev/null;\
	docker rmi -f $$(docker images -qa) > /dev/null;\
	docker volume rm $$(docker volume ls -q) > /dev/null;\
	docker network prune -f > /dev/null;\

.PHONY: build all clean