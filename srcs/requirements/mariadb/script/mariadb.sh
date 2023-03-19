# #!/bin/sh

# # try to launch mysql service
# mysqld -u root --bind-address=localhost --silent-startup > /tmp/mariastart.log 2>&1 &
# PID=$!

# until tail "/tmp/mariastart.log" | grep -qi "Version:"; do
# 	sleep 0.2
# done

# mysql << EOF
# CREATE DATABASE \`${SQL_DATABASE}\`;
# GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
# GRANT USAGE ON \`${SQL_DATABASE}\`.* TO '$WP_USER_LOGIN'@'localhost' IDENTIFIED BY '$WP_USER_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

# kill -TERM ${PID}
# sleep 3
# exec $@

mysqld -u root --bind-address=localhost --silent-startup > /tmp/mariastart.log 2>&1 &
PID=$!
until tail "/tmp/mariastart.log" | grep -qi "Version:"; do
	sleep 0.2
done

mysql <<EOF
create database \`${SQL_DATABASE}\`;
grant all privileges on \`${SQL_DATABASE}\`.* to  \`${SQL_USER}\`@'%' identified by '${SQL_PASSWORD}';
alter user 'root'@'localhost' identified by '${SQL_ROOT_PASSWORD}';
grant usage on \`${SQL_DATABASE}\`.* to '${WP_USER_LOGIN}'@'localhost' identified by '${WP_USER_PASSWORD}';
flush privileges;
EOF

kill -TERM ${PID}
chown -R mysql:mysql /var/lib/mysql;
sleep 3
exec $@

# << EOF mysqladmin -u root -p  shutdown
# $SQL_ROOT_PASSWORD
# EOF

# /etc/init.d/mysql stop

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# relaunch the service
# exec mysqld_safe
