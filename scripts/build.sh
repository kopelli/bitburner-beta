#!/bin/bash
set -ev
UPDATE_BUILD_ARTIFACTS="false";
if [ "${TRAVIS}" = "true" ] && [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    if [[ "${TRAVIS_BRANCH}" =~ ^(master|dev|travis-ci)$ ]]; then
        UPDATE_BUILD_ARTIFACTS="true";
        git checkout ${TRAVIS_BRANCH}
    fi
fi

npm run build

#if [ "$UPDATE_BUILD_ARTIFACTS" = "true" ]; then
#    git add -u
#    git commit -m "Updating bundles from ${TRAVIS_JOB_NUMBER}" --author="Deployment Bot (from Travis CI) <deploy@travis-ci.org>"
#    git push
#fi
