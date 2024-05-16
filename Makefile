Name = inception

SRCS_DIR = srcs

.PHONY: start stop clean

start:
	SRCS_DIR/docker-compose down
	SRCS_DIR/docker-compose up -d

stop:
	SRCS_DIR/docker-compose down

# ensure that only relevant containers and images are removed / via project name?
clean:
	SRCS_DIR/docker-compose down
	docker ps -a | awk '/ { print $$1 }' | xargs docker rm -f
	docker images -a | awk '/ { print $$3 }' | xargs docker rmi -f


