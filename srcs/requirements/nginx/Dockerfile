FROM alpine:3.17

RUN apk update && apk add nginx openssl && mkdir -p /etc/ssl/private && mkdir -p /etc/ssl/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=loulouCorp/CN=loumouli.42.fr"
RUN mkdir -p /var/www/html && mkdir -p /var/run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
RUN adduser www-data
RUN addgroup www-data 
RUN adduser www-data www-data
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx", "-t"]