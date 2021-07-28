#!/usr/bin/env bash
docker run -ti --rm \
	--name deadline-webservice \
	-h deadline-webservice \
	-v deadline-volume:/mnt/DeadlineRepository10 \
	-e DISPLAY=$HOSTNAME:0 \
	-p 8082:8082 \
	--link deadline-mongo:mongo \
	--entrypoint ./deadlinewebservice \
	deadline-client
