#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod -R 777 /var/lib/mysql # to be able to delete the database later on for testing purposes
/etc/init.d/mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mariadb -e "FLUSH PRIVILEGES;"
/etc/init.d/mariadb stop

exec "$@"