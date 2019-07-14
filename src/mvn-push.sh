#!/bin/sh

if [ ! "$TRAVIS_PULL_REQUEST" = "false" ]; then
    echo "PR build - skip mvn-push.sh"
    exit 0
fi

. `dirname $0`/mvn-run.sh $@
