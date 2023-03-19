#!/bin/sh

# try to launch mysql service
mysqld -u root --bind-address=localhost --silent-startup > /tmp/mariastart.log 2>&1 &
PID=$!

until tail "/tmp/mariastart.log" | grep -qi "Version:"; do
	sleep 0.2
done

mysql << EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

kill -TERM ${PID}
sleep 3
exec $@

# << EOF mysqladmin -u root -p  shutdown
# $SQL_ROOT_PASSWORD
# EOF

# /etc/init.d/mysql stop

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# relaunch the service
# exec mysqld_safe
