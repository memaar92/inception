# Pull base image
FROM debian:bookworm

# Install nginx // get upgrade?
RUN apt update && apt upgrade && apt install -y nginx



# either add cerificates here or mount as volume in docker-compose or as .env?

# Expose ports
EXPOSE 80

# Start nginx / why run it in the foreground?
CMD ["nginx", "-g", "daemon off;"]