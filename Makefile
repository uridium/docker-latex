REPO = uridium/latex

.PHONY: pull build clean

pull:
	docker pull $(REPO)

build:
	docker build -t $(REPO) .

clean:
	docker rmi $(shell docker images $(REPO) -qa)

default: build
