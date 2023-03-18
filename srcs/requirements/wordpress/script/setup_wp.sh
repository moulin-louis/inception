#!/bin/sh

sleep 5

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
  wp config create --allow-root --dbname=$SQL_DATABASE\
  --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD\
  --dbhost=mariadb:3306 --path='/var/www/wordpress'
  # wp core install --allow-root --url=loumouli.42.fr --title=Inception42\
  #  --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD\
  #  --admin_email=$WP_ADMIN_MAIL
  # wp user create $WP_USER_LOGIN $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD
fi

if [ ! -d "/run/php" ]; then
  mkdir /run/php
fi