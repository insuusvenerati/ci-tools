#!/bin/bash

set -e

CHART_VERSION=$(yq eval '.version' k8s/treats-portfolio/Chart.yaml)
CHART_NAME=$(yq eval '.name' k8s/treats-portfolio/Chart.yaml)
CHART_TARBALL="${CHART_NAME}"-"${CHART_VERSION}".tgz

echo "---Chart version: ${CHART_VERSION}---"
echo "---Chart file: ${CHART_TARBALL}---"

echo "---Logging into Helm OCI Registry---"
helm registry login -u "${REGISTRY_USERNAME}" -p "${REGISTRY_PASSWORD}" https://registry.k8s.stiforr.tech

echo "---Pushing chart to OCI Registry---"
helm push "${CHART_TARBALL}" https://registry.k8s.stiforr.tech/stiforr/"${CHART_NAME}":"${CHART_VERSION}"

echo "Done"