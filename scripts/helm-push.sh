#!/bin/bash

CHART_VERSION=$(yq eval '.version' k8s/treats-portfolio/Chart.yaml)

git clone https://github.com/insuusvenerati/charts.git

mv ${DRONE_REPO_NAME}-${CHART_VERSION}.tgz ./charts
cd ./charts
git add ${DRONE_REPO_NAME}-${CHART_VERSION}.tgz
git commit -m chore:(${DRONE_REPO_NAME}) update app version to ${CHART_VERSION}