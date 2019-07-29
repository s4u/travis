# Travis simplify scripts
[![Build Status](https://travis-ci.com/s4u/travis.svg?branch=master)](https://travis-ci.com/s4u/travis)

Those scripts simplify your travis configuration.

By default builds for **tags** are skipped,
also commit with message contains `[maven-release-plugin] prepare release` are skipped

## Supplied maven settings

- has configuration for snapshot repository from OSSRH (https://oss.sonatype.org/content/repositories/snapshots)
- has servers section:

        <servers>
            <server>
                <id>ossrh</id>
                <username>${env.CI_DEPLOY_USERNAME}</username>
                <password>${env.CI_DEPLOY_PASSWORD}</password>
            </server>
        </servers>

    So you can deliver your permissions by environment variables:  `CI_DEPLOY_USERNAME` and `CI_DEPLOY_PASSWORD`

## Examples
Example of `.travis.yml` for the latest version of those scripts:

        install:
            - mkdir -p ../utils
            - curl -Ls https://github.com/s4u/travis/archive/master.tar.gz \
              | tar -zx --strip-components 2 -C ../utils travis-master/src

        script:
            - ../utils/mvn-run.sh  clean verify  # execute always
            - ../utils/mvn-push.sh clean deploy  # execute only on push
            - ../utils/mvn-pr.sh   clean verify  # execute only on pull request
            - ../utils/mvn-tag.sh  clean verify  # execute on git tag
            - ../utils/mvn-sec-env.sh deploy     # execute if build is run in secure environment

for specific version, replace master on tag name:

        install:
            - mkdir -p ../utils
            - curl -Ls https://github.com/s4u/travis/archive/1.0.tar.gz \
              | tar -zx --strip-components 2 -C ../utils travis-1.0/src

## Travis environment operation on many repository

Simple script to manipulate travis environment variable on many repository.

example:

        ./travis-env.sh <orgName>/* list
        ./travis-env.sh <orgName>/* set NAME VALUE [travis OPTIONS]
        ./travis-env.sh <orgName>/* unset NAMES.. [travis OPTIONS]
