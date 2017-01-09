.PHONY: build help default

GIT_COMMIT=$(shell git rev-parse HEAD)
IMAGE_NAME := "image-resizer"
BIN_NAME=image-resizer

default: help

help:
	@echo 'Management commands for image-resizer:'
	@echo
	@echo 'Usage:'
	@echo '    make build-docker    Build inside an alpine docker container'
	@echo '    make tag             Tag image created by package with latest, git commit and version'
	@echo '    make push            Push tagged images to registry'
	@echo

build-docker:
	@echo "building ${BIN_NAME} ${VERSION}"
	docker build -t image-resizer:latest -f Dockerfile      .

tag:
	@echo "Tagging: latest ${VERSION} $(GIT_COMMIT)"
	docker tag $(IMAGE_NAME):local $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(GIT_COMMIT)
	docker tag $(IMAGE_NAME):local $(DOCKER_REGISTRY)/$(IMAGE_NAME):latest

push: tag
	@echo "Pushing docker image to registry: latest ${VERSION} $(GIT_COMMIT)"
	docker push $(IMAGE_NAME):$(GIT_COMMIT)
	docker push $(IMAGE_NAME):latest

