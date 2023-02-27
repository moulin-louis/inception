FROM debian:buster

COPY conf nginx.conf

RUN apt-get update ; apt-get install -y nginx openssl ; cp nginx.conf /etc/nginx/nginx.conf ; nginx -s reload

EXPOSE 443