#!/bin/sh -l
PACKAGE_JSON_PATH="${1-.}"
echo "Reading package.json from ${PACKAGE_JSON_PATH}/package.json"
PACKAGE_VERSION=$(cat ${PACKAGE_JSON_PATH}/package.json | jq '.version' | tr -d '"')
PACKAGE_RUNTIME=$(cat ${PACKAGE_JSON_PATH}/package.json | jq '.runtime' | tr -d '"')

echo "fullVersion=${PACKAGE_VERSION}" >> $GITHUB_OUTPUT
echo "fullRuntime=${PACKAGE_RUNTIME}" >> $GITHUB_OUTPUT

