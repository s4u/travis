#!/bin/sh

if [ -z "$TRAVIS_TAG" ]; then
    echo "$0 skip build - tag not found"
    exit 0
fi

_NEED_TAG=1

. `dirname $0`/mvn-run.sh $@

