ROOT	:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
NAME	:= nettools
TAG 	:= frankzhao/$(NAME)

.PHONY: all build

all: build

build:
	@docker build -t $(TAG) $(ROOT)

run:
	@docker run -it -d --name $(NAME) $(TAG)

shell:
	@docker exec -it $(NAME) bash

clean:
	@docker stop $(NAME)
	@docker rm -v $(NAME)
	@docker rmi -f $(TAG)
