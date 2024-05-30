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
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
	wp core install --allow-root --url=$WORDPRESS_URL --title="Test" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL
	wp user create bob bob@user2.com --role=author --porcelain --allow-root
	wp theme install twentytwentyfour --activate --allow-root
fi
#chmod -R 777 /var/www/html
exec "$@"