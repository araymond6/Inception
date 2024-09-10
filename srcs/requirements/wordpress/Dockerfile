FROM debian:bullseye

# Installing dependencies
RUN apt update -y && apt upgrade -y
RUN apt install software-properties-common ca-certificates lsb-release apt-transport-https wget gnupg -y 
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt update -y
RUN apt install -y php8.3 php-fpm php-mysql mariadb-client
RUN mkdir -p /run/php
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm -rf wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

# Copying php configuration file
COPY conf/www.conf /etc/php/8.3/fpm/pool.d/www.conf

# Installing wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/usr/sbin/php-fpm8.3", "-F"]

# # Copying auto_config.sh
# COPY conf/auto_config.sh /home/auto_config.sh
# RUN chmod +x /home/auto_config.sh
# ENTRYPOINT [ "/home/auto_config.sh" ]