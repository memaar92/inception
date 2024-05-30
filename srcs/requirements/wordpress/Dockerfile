FROM debian:bookworm

RUN apt update && apt install -y \
    curl \
    php8.2 \
    php8.2-cgi \
    php8.2-mysql \
    php8.2-fpm \
    php8.2-pdo \
    php8.2-gd \
    php8.2-cli \
    php8.2-mbstring

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY /tools/entrypoint-wp.sh /usr/local/bin/

ENTRYPOINT ["entrypoint-wp.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "-F"]