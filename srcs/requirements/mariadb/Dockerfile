FROM alpine:3.17

RUN apk update && apk upgrade && apk add mysql mysql-client mariadb-server-utils mariadb openrc

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./script/mariadb.sh /tmp
RUN chmod 777 /tmp/mariadb.sh
ENTRYPOINT [ "sh", "/tmp/mariadb.sh" ]

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf

CMD [ "mysqld", "--bind-address=0.0.0.0"]

EXPOSE 3306
