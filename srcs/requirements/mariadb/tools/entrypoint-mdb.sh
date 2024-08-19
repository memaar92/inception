#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod -R 777 /var/run/mysqld
chmod -R 777 /var/lib/mysql # to be able to delete the database later on for testing purposes


/etc/init.d/mariadb start
sleep 5
#mariadb -e "USE mysql;"
#mariadb -e "FLUSH PRIVILEGES;"
#mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';"
#mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "FLUSH PRIVILEGES;"
/etc/init.d/mariadb stop

exec "$@"
