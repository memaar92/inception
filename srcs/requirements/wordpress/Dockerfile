FROM debian:bookworm

#php 8.3?
RUN apt update && apt upgrade && apt install -y \
    wget \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd php-cli \
    php-mbstring \
    && rm -rf /var/lib/apt/lists/*

# configuration of default pool for php-fpm
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY /tools/entrypoint-wp.sh /usr/local/bin/

ENTRYPOINT ["entrypoint-wp.sh"]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["usr/sbin/php-fpm7.3", "-F"]