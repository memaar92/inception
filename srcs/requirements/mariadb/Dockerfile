FROM debian:bookworm

RUN apt update && apt install -y mariadb-server

COPY /conf/custom.cnf /etc/mysql/mariadb.conf.d/

# Copy script to create database and user
COPY /tools/entrypoint-mdb.sh /usr/local/bin/

# Default MariaDB port -> necessary?
#EXPOSE 3306

# Run script to create database and user
ENTRYPOINT ["entrypoint-mdb.sh"]

# Provide arguments to the entrypoint
CMD ["mysqld_safe"]