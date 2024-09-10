#!/bin/sh
sleep 10
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create --allow-root --path='/var/www/wordpress' --dbname=$MYSQL_DATA --dbuser=$MYSQL_USER --dbpass=$MYSQL_PWD --dbhost=mariadb:3306
	wp core install --url=$WP_DOMAIN --title='Wordpress' --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=email@email.com
	wp user create $WP_USER --user_pass=$WP_USER_PWD
	/usr/sbin/php-fpm8.3 -F
else
	echo "wp-config.php is already created and it exists and stuff"
fi