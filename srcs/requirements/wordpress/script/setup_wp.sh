#!bin/sh
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

sleep 2
wp core install --url=loumouli.42.fr --title=Inception-42\
  --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD\
  --admin_email=$WP_ADMIN_MAIL --allow-root --path='/var/www/wordpress'

wp user create --allow-root --role=author $WP_USER_LOGIN $WP_USER_MAIL\
 --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d "/run/php" ]; then
  mkdir /run/php
fi

/usr/sbin/php-fpm8 -F