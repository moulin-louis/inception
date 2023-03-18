FROM alpine:3.17

RUN apk update && apk upgrade && apk add mysql mysql-client mariadb-server-utils mariadb
COPY ./script/script_db.sh /tmp
RUN chmod 777 /tmp/script_db.sh
RUN /tmp/script_db.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf