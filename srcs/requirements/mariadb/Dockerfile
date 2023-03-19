FROM alpine:3.15

RUN apk upgrade; apk add mariadb mariadb-client
COPY conf/50-server.cnf	/etc/my.cnf
RUN chown -R mysql:mysql /var/lib/mysql; mysql_install_db --user=mysql;
EXPOSE 3306
COPY ./script/mariadb.sh /tmp/setup.sh
# launching my script
ENTRYPOINT ["/bin/sh", "/tmp/setup.sh"]
CMD [ "/usr/bin/mysqld", "-u", "mysql" ]
