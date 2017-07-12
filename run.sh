NAME=$1
EXECUTABLE=$2

docker run -ti --rm \
	--name $NAME \
	-h $NAME \
	-v deadline-volume:/mnt/DeadlineRepository8 \
	-e DISPLAY=$HOSTNAME:0 \
	--link deadline-mongo:mongo \
	--entrypoint $EXECUTABLE \
	deadline-client
