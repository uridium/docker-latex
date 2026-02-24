REPO    ?= ghcr.io/uridium/latex
UID     ?= $(shell id -u)
GID     ?= $(shell id -g)
WORKDIR  = /docs

.PHONY: help pull build push run clean

help:
	@echo "Available targets:"
	@echo "  build    Build the Docker image"
	@echo "  pull     Pull the latest image from the registry"
	@echo "  push     Push the image to the registry"
	@echo "  run      Run the LaTeX compiler inside the container"
	@echo "  clean    Remove the local image"
	@echo "  help     Show this help message"

pull:
	docker pull $(REPO)

build:
	docker build --pull --build-arg UID=$(UID) --build-arg GID=$(GID) -t $(REPO) .

push:
	docker push $(REPO)

run:
	docker run  --interactive --rm --network none --user $(UID):$(GID) --volume "$(PWD)":$(WORKDIR) --workdir "$(WORKDIR)" $(REPO)

clean:
	docker rmi $(shell docker images $(REPO) -qa) 2>/dev/null || true
