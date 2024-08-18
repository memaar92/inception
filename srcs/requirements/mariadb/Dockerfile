FROM debian:bullseye

RUN apt update && apt install -y mariadb-server 

COPY /conf/custom.cnf /etc/mysql/mariadb.conf.d/
COPY /tools/entrypoint-mdb.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["entrypoint-mdb.sh"]

CMD ["mysqld_safe"]