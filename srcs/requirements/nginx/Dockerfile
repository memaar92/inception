# Pull base image
FROM debian:bookworm

# Install nginx // get upgrade?
RUN apt update && apt install -y nginx

# Copy nginx config file
RUN rm /etc/nginx/nginx.conf

COPY /conf/nginx.conf /etc/nginx/nginx.conf
#COPY /conf/nginx_cust.conf /etc/nginx/sites-enabled/nginx_cust
#COPY /conf/nginx.conf /etc/nginx/nginx.conf

# either add cerificates here or mount as volume in docker-compose or as .env?

# Expose ports
EXPOSE 80

# Start nginx / why run it in the foreground?
CMD ["nginx", "-g", "daemon off;"]