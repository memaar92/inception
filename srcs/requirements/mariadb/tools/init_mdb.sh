#!/bin/bash


#create database if not existing
#create user if not existing
#grant all privileges to user on database
#flush privileges

SQL_STATEMENTS="
    CREATE DATABASE IF NOT EXISTS fruitdb;
    USE fruitdb;
    CREATE TABLE IF NOT EXISTS fruits (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        quantity INT NOT NULL
    );
    INSERT INTO fruits (name, quantity) VALUES
        ('Apple', 10),
        ('Banana', 20),
        ('Cherry', 30);
    "

/etc/init.d/mariadb start
mariadb -e "$SQL_STATEMENTS"
/etc/init.d/mariadb stop

exec "$@"