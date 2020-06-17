#Use 'make' to compile docker file
IMG_NAME=zhch5450/u_net:1

COMMAND_RUN=docker run \
	  --name pytorch_test_container \
	  --detach=false \
	  --network host \
	  --rm \
	  -e DISPLAY=${DISPLAY} \
	  -v /tmp/.X11-unix:/tmp/.X11-unix \
	  -v `pwd`:/home/developer/result \
	  -i \
	  -t \
	  ${IMG_NAME} /bin/bash -c

build:
	docker build --network host --no-cache --rm -t ${IMG_NAME} .
 
remove-image:
	docker rmi ${IMG_NAME}

run:
	$(COMMAND_RUN) \
            "bash"
