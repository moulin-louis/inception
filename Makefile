# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: loumouli <loumouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 10:25:58 by loumouli          #+#    #+#              #
#    Updated: 2023/03/10 13:33:32 by loumouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build


build:
	docker compose up --build

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);

.PHONY: build all clean