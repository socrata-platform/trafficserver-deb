FROM ubuntu:bionic
RUN apt-get update && apt-get install --yes build-essential devscripts debhelper equivs curl
