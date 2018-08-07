#!/bin/bash
set -ev
if [ "${TRAVIS}" = "true" && "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    if [ "${TRAVIS_BRANCH}" = "master" || "${TRAVIS_BRANCH}" = "dev" ]; then
        git checkout ${TRAVIS_BRANCH}
    fi
fi

npm run build

if [ "${TRAVIS}" = "true" && "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    git add -u
    git commit -m "Updating bundles from ${TRAVIS_JOB_NUMBER}"
    git push
fi
