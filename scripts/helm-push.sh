#!/bin/bash

set -e

CHART_LOCATION=${CHART_LOCATION:-"chart"}
CHART_VERSION=$(yq eval '.version' "${CHART_LOCATION}"/Chart.yaml)
CHART_NAME=$(yq eval '.name' "${CHART_LOCATION}"/Chart.yaml)
CHART_TARBALL="${CHART_NAME}"-"${CHART_VERSION}".tgz
CHART_REPO_NAME="stiforr"

echo "---Chart version: ${CHART_VERSION}---"
echo "---Chart tarball: ${CHART_TARBALL}---"
echo "---Chart repo: ${CHART_REPO_URL}---"
echo "---Chart repo name: ${CHART_REPO_NAME}---"

helm repo add ${CHART_REPO_NAME} "${CHART_REPO_URL}"

echo "---Pushing chart to OCI Registry---"
helm cm-push "${CHART_TARBALL}" ${CHART_REPO_NAME}

echo "Done"
