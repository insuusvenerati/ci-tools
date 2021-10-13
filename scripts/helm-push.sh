#!/bin/bash

CHART_VERSION=$(yq eval '.version' k8s/treats-portfolio/Chart.yaml)
CHART_TARBALL="${DRONE_REPO_NAME}"-"${CHART_VERSION}".tgz

echo "Chart version: ${CHART_VERSION}"

echo "Cloning charts repo"
git clone https://github.com/insuusvenerati/charts.git

echo "Moving ${CHART_TARBALL} to charts repo"
mv "${CHART_TARBALL}" ./charts
cd ./charts || exit

echo "Adding ${CHART_TARBALL} and commiting to repo"
git add "${CHART_TARBALL}"
git commit -m "${DRONE_REPO_NAME} update app version to ${CHART_VERSION}"

echo "Done"