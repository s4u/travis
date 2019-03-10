#!/bin/sh

if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then
    echo "push build - skip mvn-pr.sh"
    exit 0
fi

. `dirname $0`/mvn-run.sh $@
