#!/usr/bin/env bash
pushd `dirname $0` > /dev/null
DIRNAME=`pwd -P`

# This directory is available from within each Deadline slave
export SHARE=$DIRNAME/share

# Default image used with Docker Compose, defaults to a vanilla session
# You can override the image by setting an environment variable.
export IMAGE=${IMAGE:-deadline-client-maya2018}

docker-compose down

popd > /dev/null
