#!/bin/sh

if [ -z "$TRAVIS_TAG" ]; then
    echo "tag not found - skip $0"
    exit 0
fi

_NO_SKIP=1

. `dirname $0`/mvn-run.sh $@

