#!/bin/bash

# Apply some patches
patch -Np1 -r- -d poky < poky.patch
patch -Np1 -r- -d meta-webkit < meta-webkit.patch

set -o errexit

export MACHINE=${MACHINE:-raspberrypi3}

export TEMPLATECONF="../meta-resin-wpe/conf/samples"
source poky/oe-init-build-env build

bitbake resin-wpe-image

VERSION=$(git describe --dirty --always)
IMAGE="resin-wpe:$MACHINE-$VERSION"

docker import - $IMAGE < tmp/deploy/images/$MACHINE/resin-wpe-image-$MACHINE.tar.gz

echo
echo "#####################################"
echo "Created docker image: $IMAGE"
echo "#####################################"
