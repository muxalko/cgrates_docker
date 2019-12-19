NAME   := ${BIN}
PRIVATE_REGISTRY := gitlab-ptk.gt.local:5005
DOCKER_USER := rancher
DOCKER_PASS := rancher2018
VERSION := $(shell ./bin/$${BIN} --version)
TAG     := $(shell echo "${VERSION}" | sed -r 's/^CGRateS\s[0-9]\.[0-9].[0-9]\~[a-zA-Z0-9]*\sgit\+([a-zA-Z0-9]+)\s\((.+)\)/\1/')
#TAG    := $(shell sed -e 's/[ \(\)\+\:]/_/g' <<< ${VERSION})
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest



$(info IMG="$(IMG)")

build:
	@docker build -t ${IMG} -f ${BIN}/Dockerfile .
	@docker tag ${IMG} ${LATEST}
	@docker tag ${LATEST} ${PRIVATE_REGISTRY}/${BIN}:${TAG}
	@docker tag ${LATEST} ${PRIVATE_REGISTRY}/${BIN}:latest

push:
	@docker push ${PRIVATE_REGISTRY}/${BIN}:${TAG}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS} ${PRIVATE_REGISTRY}
