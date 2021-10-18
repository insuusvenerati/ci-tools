#!/bin/bash

SENTRY_RELEASE=$DRONE_TAG
SENTRY_ENVIRONMENT=$(/scripts/environment.sh)

echo "---Sentry Release: ${SENTRY_RELEASE}---"
echo "---Sentry Environment: ${SENTRY_ENVIRONMENT}---"
echo "---Sentry Project: ${SENTRY_PROJECT}---"

sentry-cli --auth-token $SENTRY_AUTH_TOKEN releases new $SENTRY_RELEASE -p $SENTRY_PROJECT
sentry-cli --auth-token $SENTRY_AUTH_TOKEN releases set-commits $SENTRY_RELEASE --auto
sentry-cli --auth-token $SENTRY_AUTH_TOKEN releases files $SENTRY_RELEASE upload-sourcemaps ./public
sentry-cli --auth-token $SENTRY_AUTH_TOKEN releases finalize $SENTRY_RELEASE
sentry-cli --auth-token $SENTRY_AUTH_TOKEN releases deploys $SENTRY_RELEASE new -e $SENTRY_ENVIRONMENT