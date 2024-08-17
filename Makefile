COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY: all start build stop clean fclean prune re

all: start

start:
	docker compose -f $(COMPOSE_FILE) up -d

build:
	docker compose -f $(COMPOSE_FILE) build

stop:
	docker compose -f $(COMPOSE_FILE) down

clean:
	docker compose -f $(COMPOSE_FILE) down -v
	rm -rf ~/data/mariadb/*
	rm -rf ~/data/wordpress/*

#removes all Docker resources defined in the specified Docker Compose file and additionally removes local Docker images that were used by the services
fclean:
	docker compose -f $(COMPOSE_FILE) down --rmi local -v
	rm -rf ~/data/mariadb/*
	rm -rf ~/data/wordpress/*

# Remove all unused containers, networks, images and volumes
prune:
	docker system prune --all --force --volumes

re: fclean start