#!/usr/bin/env bash
#
# Copy the Deadline Repository into an internal Docker volume
#
docker run -ti --rm \
	-v $(pwd)/installers:/installers \
	-v deadline-volume:/installdir \
	-w /installers \
	centos:7 bash -c "
		echo Installing Deadline Repository 8.0 into deadline-volume..;\
		./DeadlineRepository-8.*-linux-x64-installer.run \
	    --mode unattended \
	    --dbhost mongo \
	    --dbport 27017 \
	    --prefix /installdir \
	    --installmongodb false \
	    --prepackagedDB false; \
	echo Finished successfully"
