# Pull base image
FROM debian:bookworm

# Install nginx
RUN apt-get update && apt-get install -y nginx

COPY index.html /var/www/html/index.html

# Expose ports
EXPOSE 80

# Start nginx / whyt run it in the foreground?
CMD ["nginx", "-g", "daemon off;"]