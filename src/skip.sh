#!/bin/sh

if [ "$TRAVIS_TAG" ]; then
    echo "$0 skip build for tag: $TRAVIS_TAG"
    exit 0
fi

if git log -1 --format=%B $TRAVIS_COMMIT | grep -q "\[maven-release-plugin\] prepare release"; then
    echo "$0 skip build for maven prepare release"
    exit 0
fi