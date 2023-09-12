#!/bin/sh -l
PACKAGE_JSON_PATH="${1-.}"
echo "Reading package.json from ${PACKAGE_JSON_PATH}/package.json"
PACKAGE_VERSION=$(cat ${PACKAGE_JSON_PATH}/package.json | jq '.version' | tr -d '"')
PACKAGE_RUNTIME=$(cat ${PACKAGE_JSON_PATH}/package.json | jq '.runtime' | tr -d '"')

echo "versionMajor=$(cut -d '.' -f 1 <<< ${PACKAGE_VERSION})" >> $GITHUB_OUTPUT
echo "versionMinor=$(cut -d '.' -f 1,2 <<< ${PACKAGE_VERSION})" >> $GITHUB_OUTPUT
echo "versionFull=${PACKAGE_VERSION}" >> $GITHUB_OUTPUT

echo "runtimeMajor=$(cut -d '.' -f 1 <<< ${PACKAGE_RUNTIME})" >> $GITHUB_OUTPUT
echo "runtimeMinor=$(cut -d '.' -f 1,2 <<< ${PACKAGE_RUNTIME})" >> $GITHUB_OUTPUT
echo "runtimeFull=${PACKAGE_RUNTIME}" >> $GITHUB_OUTPUT

