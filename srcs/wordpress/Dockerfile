FROM alpine:3.17

RUN echo "http://mirrors.ircam.fr/pub/alpine/edge/community" >> /etc/apk/repositories && apk update &&  apk add php8-fpm

CMD ["tail", "-f"]