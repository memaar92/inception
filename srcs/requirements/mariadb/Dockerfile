FROM debian:bookworm

# Install MariaDB
RUN apt update && apt upgrade && apt install -y mariadb-server

# Copy config file into the correct location in the container

# run script to create database and user

# Default MariaDB port -> necessary?
EXPOSE 3306

# run with config file as argument?
CMD ["mysql_safe"]