FROM debian:bullseye

# Install nginx, vim, curl, openssl (for TLS1.2/1.3)
RUN apt update -y && apt upgrade -y
RUN apt install -y nginx vim curl openssl
RUN apt clean 
RUN mkdir -p /etc/nginx/ssl 

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=araymond.42.fr/UID=araymond"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]