NAME=$1
EXECUTABLE=$2

docker run -ti --rm \
	--name $NAME \
	-h $NAME \
	-v deadline-volume:/mnt/DeadlineRepository8 \
	-v $(pwd)/share:/share \
	-e DISPLAY=192.168.1.212:0 \
	--link deadline-mongo:mongo \
	--entrypoint $EXECUTABLE \
	deadline-client-maya
