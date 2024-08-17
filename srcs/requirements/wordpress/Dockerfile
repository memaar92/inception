FROM debian:bullseye

RUN apt update && apt install -y \
    curl \
    php7.4 \
    php7.4-cgi \
    php7.4-mysql \
    php7.4-fpm \
    php7.4-pdo \
    php7.4-gd \
    php7.4-cli \
    php7.4-mbstring

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY /tools/entrypoint-wp.sh /usr/local/bin/

ENTRYPOINT ["entrypoint-wp.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]