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
	wp core config --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
	wp core install --allow-root --url=$WORDPRESS_URL --title="Test" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL
	wp user create test --allow-root --role=editor --user_pass=$WORDPRESS_DB_PASSWORD
	wp theme install twentytwentyfour --activate --allow-root

	#Download wordpress
	#wget https://wordpress.org/latest.tar.gz
	#tar -xzvf latest.tar.gz
	#mv wordpress/* .
	#rm -rf latest.tar.gz
	#rm -rf wordpress

    #Import env variables in the config file
	#sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
	#sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
	#sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
	#sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config-sample.php
	#mv wp-config-sample.php wp-config.php
fi
#chmod -R 777 /var/www/html
exec "$@"