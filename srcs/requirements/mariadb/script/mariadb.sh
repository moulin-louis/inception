#!/bin/sh

# try to launch mysql service
/etc/init.d/mysql start
# create all mandatory database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# add password to root
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${SQL_ROOT_PASSWORD}';"
# shutdown the database
mysql -e "FLUSH PRIVILEGES;"

# << EOF mysqladmin -u root -p  shutdown
# $SQL_ROOT_PASSWORD
# EOF

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# relaunch the service
exec mysqld_safe
