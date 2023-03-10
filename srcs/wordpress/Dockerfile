FROM alpine:3.17

RUN apk update && echo "http://mirrors.ircam.fr/pub/alpine/edge/community" >> /etc/apk/repositories && apk add php8-fpm

CMD ["tail", "-f"]