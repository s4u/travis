#!/bin/sh

BASE_DIR=`dirname $0`

. $BASE_DIR/skip.sh

MVN_TO_RUN="mvn --errors --show-version --settings $BASE_DIR/settings.xml $@"
echo "Run: $MVN_TO_RUN"

$MVN_TO_RUN