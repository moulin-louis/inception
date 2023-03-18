FROM alpine:3.17

RUN apk update && apk upgrade && apk add mysql mysql-client mariadb-server mariadb-server-utils mariadb openrc
# RUN rc-service mariadb start
# CMD [ "rc-service", "mariadb", "start" ]
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# RUN /etc/init.d/mariadb setup

COPY ./script/mariadb.sh /tmp
RUN chmod 777 /tmp/mariadb.sh
ENTRYPOINT [ "sh", "/tmp/mariadb.sh" ]
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
CMD [ "mysqld", "--bind-address=0.0.0.0"]
# CMD [ "tail", "-f" ]
EXPOSE 3306
