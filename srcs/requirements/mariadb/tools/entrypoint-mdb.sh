#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod -R 777 /var/lib/mysql # to be able to delete mariadb data later on for testing purposes

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

echo "FLUSH PRIVILEGES;" >> init.sql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mariadbd --user=mysql --bootstrap < init.sql

rm init.sql

exec "$@"
