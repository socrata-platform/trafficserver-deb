#! /bin/bash
docker run --env-file config/env -i --rm --volume $(pwd):/mnt/trafficserver-deb trafficserver-deb:latest /bin/bash <<SCRIPT
set -e
set -x

mkdir /tmp/build
cd /tmp/build

curl -LO http://mirrors.ocf.berkeley.edu/apache/trafficserver/trafficserver-\$SOFTWARE_VERSION.tar.bz2
tar -xf trafficserver-\$SOFTWARE_VERSION.tar.bz2

cp -r /mnt/trafficserver-deb/debian trafficserver-\$SOFTWARE_VERSION
cd trafficserver-\$SOFTWARE_VERSION

apt-get update
echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90assumeyes

debchange --create -v \$SOFTWARE_VERSION-\$PACKAGE_VERSION --package trafficserver \
  "Apache Traffic Server \$SOFTWARE_VERSION-\$PACKAGE_VERSION"
mk-build-deps --install debian/control
debuild -us -uc -B

mv ../trafficserver_*_*.deb /mnt/trafficserver-deb
chown $(id -u):$(id -g) /mnt/trafficserver-deb/trafficserver_*_*.deb
SCRIPT
