#!/bin/sh

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wget -q http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -fr latest.tar.gz
cp -r ./wordpress/* .
rm -rf ./wordpress
touch /var/log/php8/www.error.log && chmod 666 /var/log/php8/www.error.log
/usr/local/bin/wp	--info
/usr/local/bin/wp	core download --allow-root --path="/var/www/html"

rm					-f /var/www/html/wp-config.php
cp					./wp-config.php /var/www/html/wp-config.php

/usr/local/bin/wp	core install \
					--allow-root \
					--path="/var/www/html" \
					--url=${WORDPRESS_HOST} \
					--title=${WORDPRESS_TITLE} \
					--admin_user=${WORDPRESS_ADMIN_USER} \
					--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
					--admin_email=${WORDPRESS_ADMIN_EMAIL} \
					--skip-email

/usr/local/bin/wp	user create \
					--allow-root \
					--path="/var/www/html" \
					${WORDPRESS_USER} \
					${WORDPRESS_EMAIL} \
					--role=author \
					--user_pass=${WORDPRESS_PASSWORD}
exec $@