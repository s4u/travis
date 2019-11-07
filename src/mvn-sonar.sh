#!/bin/sh

_NO_SKIP=1

if [ -z "$SONARQUBE_SCANNER_PARAMS" \
        -a ! "$TRAVIS_PULL_REQUEST" = "false" \
        -a -n "$TRAVIS_PULL_REQUEST_SLUG" \
        -a -n "$TRAVIS_PULL_REQUEST_BRANCH" ]; then
    echo "Setup sonar for PR"
    if [ -n "$SONAR_TOKEN" ]; then
        _ST=$SONAR_TOKEN
    else
        _ST=`echo "OTg3ZmJmNjk5NGVmNDljZDU4MTcyYWU5N2E4MjgyYTZkN2VmODZjYwo=" | openssl base64 -d`
    fi
    export SONARQUBE_SCANNER_PARAMS="{\
        \"sonar.pullrequest.key\" : \"$TRAVIS_PULL_REQUEST\",\
        \"sonar.pullrequest.base\": \"$TRAVIS_BRANCH\",\
        \"sonar.pullrequest.branch\": \"$TRAVIS_PULL_REQUEST_SLUG/$TRAVIS_PULL_REQUEST_BRANCH\",\
        \"sonar.pullrequest.github.repository\": \"$TRAVIS_REPO_SLUG\",\
        \"sonar.login\": \"$_ST\"}"
fi

if [ -z "$SONARQUBE_SCANNER_PARAMS" ]; then
    echo "no configuration for sonar - skip"
    exit 0
fi

. `dirname $0`/mvn-run.sh $@
