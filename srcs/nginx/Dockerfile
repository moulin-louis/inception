FROM alpine:3.17

RUN apk update && apk add nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=loulouCorp/CN=loumouli.42.fr" && mkdir -p /var/www/html

COPY ./nginx.conf /etc/nginx/sites-enabled/default
COPY ./index.html /var/www/html

EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]
CMD ["nginx", "-t"]