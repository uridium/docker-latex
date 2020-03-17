REPO = uridium/latex
UID = $(shell id -u)
GID = $(shell id -g)

.PHONY: pull build clean

default: build

pull:
	docker pull $(REPO)

build:
	docker build --build-arg UID=$(UID) --build-arg GID=$(GID) -t $(REPO) .

clean:
	docker rmi $(shell docker images $(REPO) -qa)
