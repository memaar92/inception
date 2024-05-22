FROM debian:bookworm

# Install MariaDB
RUN apt update && apt upgrade && apt install -y mariadb-server

# Copy config file into the correct location in the container
COPY /conf/custom.cnf /etc/mysql/mariadb.conf.d/custom.cnf

# Copy script to create database and user
COPY /tools/init_mdb.sh /usr/local/bin/init_mdb.sh

# Default MariaDB port -> necessary?
#EXPOSE 3306

# Run script to create database and user
ENTRYPOINT ["init_mdb.sh"]

# Provide arguments to the entrypoint
CMD ["mysqld_safe"]