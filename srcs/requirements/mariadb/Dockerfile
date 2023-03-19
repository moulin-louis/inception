FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY script/mariadb.sh /mariadb.sh

CMD ["mysqladmin", "--help"]

ENTRYPOINT ["bash", "mariadb.sh"]

EXPOSE 3306