#!/bin/sh

_NEED_TAG=1

echo "$SONARQUBE_SCANNER_PARAMS"

. `dirname $0`/mvn-run.sh $@
