#!/bin/sh


if [ "$TRAVIS_SECURE_ENV_VARS" = "false" ]; then
    echo "no secure environment - skip $0"
    exit 0
fi

. `dirname $0`/mvn-run.sh $@
