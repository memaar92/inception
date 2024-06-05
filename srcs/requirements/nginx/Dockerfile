FROM debian:bullseye

RUN apt update && apt install -y nginx

RUN rm /etc/nginx/sites-enabled/default
COPY /conf/nginx_inception.conf /etc/nginx/conf.d/

# either add certificates here or mount as volume in docker-compose or as .env?

# Expose ports
EXPOSE 80
EXPOSE 443

# Start nginx / why run it in the foreground?
CMD ["nginx", "-g", "daemon off;"]