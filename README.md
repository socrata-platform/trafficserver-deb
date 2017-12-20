trafficserver-deb
=================

This project contains tools necessary to build a simple Debian package from
source.


Instructions
============

1. Build the Docker image
       
    ```
    $ docker build -t trafficserver-deb:latest .
    ```

2. Perform the build
   
   * Using the defualt ATS and package version numbers from `config/defaults`
   
       ```
       $ bin/build.sh
       ```
   
   * Specifying the ATS and package version numbers
   
       ```
       $ bin/build.sh -e SOFTWARE_VERSION=6.2.2 -e PACKAGE_VERSION=1
       ```
