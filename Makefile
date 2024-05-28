COMPOSE_FILE = ./srcs/docker-compose.yaml

.PHONY: all start build stop clean fclean prune re

all: start

start:
	docker compose -f $(COMPOSE_FILE) up -d

#for building the images of the services defined in the specified Docker Compose file
build:
	docker compose -f $(COMPOSE_FILE) build

stop:
	docker compose -f $(COMPOSE_FILE) down

clean:
	docker compose -f $(COMPOSE_FILE) down -v

#removes all Docker resources defined in the specified Docker Compose file and additionally removes local Docker images that were used by the services
fclean:
	docker compose -f $(COMPOSE_FILE) down --rmi local -v

# Remove all unused containers, networks, images and volumes --> delete folders/files?
prune:
	docker system prune --all --force --volumes

re: fclean start