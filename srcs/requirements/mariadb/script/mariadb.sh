#!/bin/sh

# try to launch mysql service
mysqld -u root --bind-address=localhost --silent-startup > /tmp/mariastart.log 2>&1 &
PID=$!

sleep 10
# create all mandatory database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# add password to root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# shutdown the database
mysql -e "FLUSH PRIVILEGES;"

kill -TERM ${PID}
chown -R mysql:mysql /var/lib/mysql

exec $@

# << EOF mysqladmin -u root -p  shutdown
# $SQL_ROOT_PASSWORD
# EOF

# /etc/init.d/mysql stop

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# relaunch the service
# exec mysqld_safe
