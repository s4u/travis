#!/bin/sh

if [ ! "$TRAVIS_PULL_REQUEST" = "false" ]; then
    echo "PR build - skip $0"
    exit 0
fi

. `dirname $0`/mvn-run.sh $@
