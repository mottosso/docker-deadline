#!/usr/bin/env bash
pushd `dirname $0` > /dev/null
DIRNAME=`pwd -P`
popd > /dev/null

$DIRNAME/run.sh deadline-monitor ./deadlinemonitor
