Name = inception

SRCS_DIR = ./srcs

.PHONY: start stop clean

start:
	cd $(SRCS_DIR) && docker-compose down
	cd $(SRCS_DIR) && docker-compose up -d

stop:
	cd $(SRCS_DIR) && docker-compose down

# Make sure to only remove images and containers we really want to remove -> via project name?
# Also remove network?
clean:
	@container_ids=$$(cd $(SRCS_DIR) && docker ps -a | awk 'NR > 1 { print $$1 }'); \
	if [ -n "$$container_ids" ]; then \
		echo "$$container_ids" | xargs docker rm -f; \
	fi
	@image_ids=$$(cd $(SRCS_DIR) && docker images -a | awk 'NR > 1 { print $$3 }'); \
	if [ -n "$$image_ids" ]; then \
		echo "$$image_ids" | xargs docker rmi -f; \
	fi
