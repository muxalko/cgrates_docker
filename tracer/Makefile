NAME   := tracer
PRIVATE_REGISTRY := gitlab-ptk.gt.local:5005
DOCKER_USER := rancher
DOCKER_PASS := rancher2018
LATEST := latest
TAG    := 1.1
IMG    := ${NAME}:${TAG}
IMG_LATEST    := ${NAME}:${LATEST}

$(info IMG="$(IMG)")
file_with_date := marker
create_marker:
	@echo "==> creating marker"
	echo "$$(date +%FT%T%Z)" > $(file_with_date)
	cat $(file_with_date)

build:
	@docker build -t ${IMG_LATEST} ./

tag:
	@docker tag ${IMG_LATEST} ${IMG}
	@docker tag ${IMG_LATEST} ${PRIVATE_REGISTRY}/${IMG}
	@docker tag ${IMG_LATEST} ${PRIVATE_REGISTRY}/${IMG_LATEST}

push:
	@docker push ${PRIVATE_REGISTRY}/${IMG}
	@docker push ${PRIVATE_REGISTRY}/${IMG_LATEST}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS} ${PRIVATE_REGISTRY}
