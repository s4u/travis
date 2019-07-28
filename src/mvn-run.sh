#!/bin/sh

BASE_DIR=`dirname $0`

. ${BASE_DIR}/skip.sh

# suppress "Downloading ..." messages from maven log, it need batch mode, which is set in settings.xml
export MAVEN_OPTS="$MAVEN_OPTS -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn"

MVN_TO_RUN="mvn --errors --show-version --settings $BASE_DIR/settings.xml $@"
echo "Run: $MVN_TO_RUN"

${MVN_TO_RUN}
