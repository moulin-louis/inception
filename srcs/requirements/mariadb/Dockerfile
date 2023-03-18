FROM alpine:3.17

RUN apk update && apk upgrade && apk add mysql mysql-client mariadb-server-utils mariadb
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN /etc/init.d/mariadb setup

COPY ./script/script_db.sh /tmp
RUN chmod 777 /tmp/script_db.sh
# ENTRYPOINT [ "sh", "/tmp/script_db.sh" ]
CMD [ "tail", "-f" ]
EXPOSE 3306
