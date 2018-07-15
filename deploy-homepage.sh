#!/bin/bash

CONTAINER=homepage
docker container stop $CONTAINER
docker rm $CONTAINER
docker pull guydocker/minima
docker run --detach --name=$CONTAINER --restart=always --publish=80:80 \
	--publish=443:443 --volume=/etc/letsencrypt/:/etc/letsencrypt/ \
	--volume=/etc/nginx/:/etc/nginx/ guydocker/minima
docker rmi $(docker images --filter "dangling=true" --quiet)
