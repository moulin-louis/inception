FROM alpine:3.17

RUN echo "http://mirrors.ircam.fr/pub/alpine/edge/testing" >> /etc/apk/repositories \
	&&	apk update \
	&& apk add --no-cache php8 \
    php8-common \
	php8-session\
	php8-gd\
	php8-pecl-mcrypt\
	php8-soap\
	php8-gettext\
	php8-ldap\
	php8-mysqli\
	php8-ctype\
	php8-posix\
	php8-cgi\
	php8-pecl-xmlrpc\
	php8-imap\
    php8-fpm \
	fcgi\
    php8-pdo \
    php8-opcache \
    php8-zip \
    php8-phar \
    php8-iconv \
    php8-cli \
    php8-curl \
    php8-openssl \
    php8-mbstring \
    php8-tokenizer \
    php8-fileinfo \
    php8-json \
    php8-xml \
    php8-xmlwriter \
    php8-simplexml \
    php8-dom \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-tokenizer \
    php8-pecl-redis \
	curl \
	wget \
	&& ln /usr/bin/php8 /usr/bin/php

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

RUN	adduser -u 82 -D -S -G www-data www-data
RUN chmod 777 -R /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mkdir /run/php

COPY ./www.conf /etc/php8/php-fpm.d/www.conf

COPY ./setup_wp.sh /tmp/setup_wp.sh
RUN chmod +x /tmp/setup_wp.sh
ENTRYPOINT [ "sh", "/tmp/setup_wp.sh" ]

WORKDIR /var/www/html/wordpress

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-F"]
# CMD ["/usr/sbin/php-fpm8", "-tt"]

