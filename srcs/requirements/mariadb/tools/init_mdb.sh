#!/bin/bash


#create database if not existing
#create user if not existing
#grant all privileges to user on database
#flush privileges

/etc/init.d/mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER''@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
#mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$WPHOST.$WPHOST' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"
/etc/init.d/mariadb stop

exec "$@"