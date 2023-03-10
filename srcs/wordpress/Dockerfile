FROM alpine:3.17

RUN 	echo "http://mirrors.ircam.fr/pub/alpine/edge/testing" >> /etc/apk/repositories \
	&&	apk update \
	&& apk add	php8\
				php8-cli\
				php8-fpm

CMD ["php8", "-v"]
