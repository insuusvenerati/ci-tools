#!/bin/bash

set -e

CHART_VERSION=$(yq eval '.version' k8s/treats-portfolio/Chart.yaml)
CHART_NAME=$(yq eval '.name' k8s/treats-portfolio/Chart.yaml)
CHART_TARBALL="${CHART_NAME}"-"${CHART_VERSION}".tgz
CHART_REPO_NAME=${CHART_NAME}

echo "---Chart version: ${CHART_VERSION}---"
echo "---Chart file: ${CHART_TARBALL}---"
echo "---Chart file: ${CHART_REPO_URL}---"
echo "---Chart file: ${CHART_REPO_NAME}---"

helm repo add ${CHART_REPO_NAME} ${CHART_REPO_URL}

echo "---Pushing chart to OCI Registry---"
helm s3 push "${CHART_TARBALL}" ${CHART_REPO_NAME}

echo "Done"