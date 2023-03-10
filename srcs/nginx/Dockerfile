FROM alpine:3.17

COPY ./nginx.conf /var/www/html

RUN apk update && apk add nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=loulouCorp/CN=loumouli.42.fr";
RUN ls

RUN tail -f