#!/bin/sh

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz