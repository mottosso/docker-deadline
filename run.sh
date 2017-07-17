NAME=$1
EXECUTABLE=$2

docker run -ti --rm \
	--name $NAME \
	-h $NAME \
	-v deadline-volume:/mnt/DeadlineRepository8 \
	-v $(pwd)/share:/share \
	-e DISPLAY=$HOSTNAME:0 \
	--link deadline-mongo:mongo \
	--entrypoint $EXECUTABLE \
	deadline-client-maya
