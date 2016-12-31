#!/bin/sh

if [ "$TRAVIS_TAG" ]; then
    echo "$0 skip build for tag: $TRAVIS_TAG"
    exit 0
fi
