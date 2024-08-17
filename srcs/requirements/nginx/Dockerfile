FROM debian:bullseye

RUN apt update && apt install -y nginx

RUN rm /etc/nginx/sites-enabled/default
COPY /conf/nginx_inception.conf /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]