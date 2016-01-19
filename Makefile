ROOT	:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
NAME	:= nettools
VERSION := 1.0
TAG 	:= chickenmaru/$(NAME):$(VERSION)

.PHONY: all build

all: build

build:
	@docker build -t $(TAG) $(ROOT)

run:
	@docker run --privileged -it -d --name $(NAME) $(TAG)

shell:
	@docker exec -it $(NAME) bash

clean:
	@docker stop $(NAME)
	@docker rm -v $(NAME)
	@docker rmi -f $(TAG)
