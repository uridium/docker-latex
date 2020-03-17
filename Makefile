REPO = uridium/latex
UID = $(shell id -u)
GID = $(shell id -g)

.PHONY: pull build run clean

default: run

pull:
	docker pull $(REPO)

build:
	docker build --build-arg UID=$(UID) --build-arg GID=$(GID) -t $(REPO) .

run:
	docker run --rm --network none --name xelatex -u "$(UID):$(GID)" -v "$(shell pwd):/docs:rw" $(REPO) $(f)

clean:
	docker rmi $(shell docker images $(REPO) -qa)
