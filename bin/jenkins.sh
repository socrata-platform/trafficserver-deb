#! /usr/bin/env bash
set -e
set -x

if [ -z "${SOFTWARE_VERSION}" ] || [ -z "${PACKAGE_VERSION}" ]; then
  echo "You MUST set both SOFTWARE_VERSION and PACKAGE_VERSION environment variables."
  exit 1
fi

docker build -t trafficserver-deb:latest .
bin/build.sh -e SOFTWARE_VERSION=${SOFTWARE_VERSION} -e PACKAGE_VERSION=${PACKAGE_VERSION}
