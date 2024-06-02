#!/bin/sh
mkdir run/php
cd /var/www/html

if [ -f ./wp-config.php ]
then
	echo "wordpress already installed"
else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --path=/var/www/html --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_URL --title="Kobold" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create bobby bob@mcbob.com --role=author --porcelain --allow-root
	wp theme install twentytwentyfour --activate --allow-root
fi
chmod -R 777 /var/www/html
exec "$@"