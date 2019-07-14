#!/bin/sh

if [ -z "$TRAVIS_TAG" ]; then
    echo "$0 skip build - tag not found"
    exit 0
fi

BASE_DIR=`dirname $0`

MVN_TO_RUN="mvn --errors --show-version --settings $BASE_DIR/settings.xml $@"
echo "Run: $MVN_TO_RUN"

$MVN_TO_RUN
