#!/bin/sh

if [ -n "$SONAR_TOKEN" ]; then
    _ST=$SONAR_TOKEN
else
    _ST=`echo "OTg3ZmJmNjk5NGVmNDljZDU4MTcyYWU5N2E4MjgyYTZkN2VmODZjYwo=" | openssl base64 -d`
fi

if [ -z "$SONARQUBE_SCANNER_PARAMS" \
        -a ! "$TRAVIS_PULL_REQUEST" = "false" \
        -a -n "$TRAVIS_PULL_REQUEST_SLUG" \
        -a -n "$TRAVIS_PULL_REQUEST_BRANCH" ]; then
    echo "Setup sonar for PR"
    export SONARQUBE_SCANNER_PARAMS="{\
        \"sonar.pullrequest.key\" : \"$TRAVIS_PULL_REQUEST\",\
        \"sonar.pullrequest.base\": \"$TRAVIS_BRANCH\",\
        \"sonar.pullrequest.branch\": \"$TRAVIS_PULL_REQUEST_SLUG/$TRAVIS_PULL_REQUEST_BRANCH\",\
        \"sonar.pullrequest.github.repository\": \"$TRAVIS_REPO_SLUG\",\
        \"sonar.login\": \"$_ST\"}"
fi

if [ -z "$SONARQUBE_SCANNER_PARAMS" ]; then
    echo "Standard sonar configuration"
    export SONARQUBE_SCANNER_PARAMS="{\"sonar.login\": \"$_ST\"}"
fi

. `dirname $0`/mvn-run.sh $@
