#!/bin/sh

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wget -q http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz