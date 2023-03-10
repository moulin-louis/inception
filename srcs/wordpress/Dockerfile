FROM alpine:3.17

RUN 	echo "http://mirrors.ircam.fr/pub/alpine/edge/testing" >> /etc/apk/repositories \
	&&	apk update \
	&& apk add --no-cache php8 \
    php8-common \
    php8-fpm \
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
	&& ln /usr/bin/php8 /usr/bin/php &&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

COPY ./www.conf /etc/php8/php-fpm.d/www.conf

EXPOSE 9000

CMD ["/usr/sbin/php8-fpm8", "-F"]
