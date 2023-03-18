mkdir /run/openrc && touch /run/openrc/softlevel

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
<< EOF mysql_secure_installation
1234
n
Y
$SQL_ROOT_PASSWORD
Y
n
Y
Y
EOF
rc-service mariadb restart

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e " CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL USER 'root'@'localhost' IDENTIFIED by '${SQL_ROOT_PASSWORD}'"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec "$@"
