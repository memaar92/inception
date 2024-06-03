#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
chmod 777 /var/run/mysqld
#chown -R mysql:mysql /var/lib/mysql
#mkdir /run/mysqld
#chown -R mysql:mysql /run/mysqld
#touch /var/lib/mysql/initialized
#mariadb-install-db --user=mysql --datadir=/var/lib/mysql
chmod -R 777 /var/lib/mysql # to be able to delete the database later on for testing purposes
/etc/init.d/mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mariadb -e "FLUSH PRIVILEGES;"
/etc/init.d/mariadb stop

exec "$@"