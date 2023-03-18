/etc/init.d/mariadb setup

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e " CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL USER 'root'@'localhost' IDENTIFIED by '${SQL_ROOT_PASSWORD}'"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown