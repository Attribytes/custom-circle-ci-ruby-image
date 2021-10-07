.PHONY: test all
default: build ;
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
GIT_HASH := $(shell git rev-parse HEAD)

build:
	docker build -t attribytes/custom-circle-ci-ruby-image:$(GIT_BRANCH) .

push:
	docker push attribytes/custom-circle-ci-ruby-image:$(GIT_BRANCH)
