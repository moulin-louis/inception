FROM alpine:3.17

RUN apk update && apk upgrade && apk add mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf