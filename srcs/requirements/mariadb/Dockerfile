FROM debian:buster

# Update and install mariadb and mariadb tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

# try to copy the conf file everywhere to be sure
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf	/etc/my.cnf
COPY conf/50-server.cnf	/etc/mysql/my.cnf
COPY conf/50-server.cnf	~/my.cnf
COPY script/mariadb.sh /mariadb.sh

RUN mkdir -p /var/lib/mysql

# Exposing port 3306 to communicate with wordpress
EXPOSE 3306

# launching my script
ENTRYPOINT ["bash", "mariadb.sh"]
CMD ["/usr/bin/mysqld", "-u", "mysql"]
