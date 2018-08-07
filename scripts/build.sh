#!/bin/bash
set -ev
if [ "${TRAVIS}" = "true" && "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    if [ "${TRAVIS_BRANCH}" = "master" || "${TRAVIS_BRANCH}" = "dev" ]; then
        # Running on Travis, but not triggered by a pull request. Assume it's a branch
        git checkout ${TRAVIS_BRANCH}
    fi
fi

npm run build

if [ "${TRAVIS}" = "true" && "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    git add -u
    git commit -m "Updating bundles from ${TRAVIS_JOB_NUMBER}"
    git push
fi
