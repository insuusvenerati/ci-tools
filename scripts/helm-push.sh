#!/bin/bash

VERSION=$(jq -r .version package.json)

git clone https://github.com/insuusvenerati/charts.git

mv ${DRONE_REPO_NAME}-${VERSION}.tgz ./charts
cd ./charts
git add ${DRONE_REPO_NAME}-${VERSION}.tgz
git commit -m chore:(${DRONE_REPO_NAME}) update app version to ${VERSION}