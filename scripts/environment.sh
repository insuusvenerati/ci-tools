#!/bin/bash

environment() {
  if [[ "$DRONE_TAG" == *"develop"* ]]; then
    SENTRY_ENVIRONMENT="development"
  else
    SENTRY_ENVIRONMENT="production"
  fi
}

environment
echo $SENTRY_ENVIRONMENT