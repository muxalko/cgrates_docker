NAME   := cgrates
PRIVATE_REGISTRY := gitlab-ptk.gt.local:5005
DOCKER_USER := rancher
DOCKER_PASS := rancher2018
TAG    := devel
IMG    := ${NAME}:${TAG}

$(info IMG="$(IMG)")

build:
	@docker build -t ${IMG} ./
	@docker tag ${IMG} ${PRIVATE_REGISTRY}/${IMG}

push:
	@docker push ${PRIVATE_REGISTRY}/${IMG}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS} ${PRIVATE_REGISTRY}