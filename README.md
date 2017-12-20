trafficserver-deb
=================

This project contains tools necessary to build a simple Debian package from
source.


Instructions
============

1. Build the Docker image
        ```
        $ docker build -t trafficserver-deb:latest
        ```
2. Perform the build
        ```
        $ bin/build.sh
        ```

Bump the version
----------------

Both the version of ATS to build and the package version can be controlled by
editing `config/env`.
