#!/bin/sh

if [ -z "$TRAVIS_TAG" ]; then
    echo "tag not found - skip $0"
    exit 0
fi

_NEED_TAG=1

. `dirname $0`/mvn-run.sh $@

