#!bin/sh
sleep 10
rm -rf /var/www/wordpress/wp-config.php
wp config create --allow-root\
  --dbname=$SQL_DATABASE\
  --dbuser=$SQL_USER\
  --dbpass=$SQL_PASSWORD\
  --dbhost=mariadb\
  --path='/var/www/wordpress'
sleep 2

wp core install --url=loumouli.42.fr --title="Inception-42"\
  --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD\
  --admin_email=$WP_ADMIN_MAIL --allow-root --path='/var/www/wordpress'

wp user create --allow-root --role=author $WP_USER_LOGIN $WP_USER_MAIL\
 --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' >> /log.txt

if [ ! -d "/run/php" ]; then
  mkdir /run/php
fi

exec $@