#!/bin/sh

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wget -q http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -fr latest.tar.gz
cp -r ./wordpress/* .
rm -rf ./wordpress
touch /var/log/php8/www.error.log && chmod 666 /var/log/php8/www.error.log
exec $@