#!/bin/bash

# Change this to something else I forgot what I wanted to do here xD
ARCH=`arch`

echo "Arch Type: $ARCH"

if [ "$ARCH" == "x86_64" ]; then
    wget -c https://repo-feed.flightradar24.com/linux_x86_64_binaries/fr24feed_1.0.34-0_amd64.tgz -O - | tar -xz
    mv fr24feed_amd64 fr24feed
fi

if [ "$ARCH" == "x86" ]; then
    wget -c https://repo-feed.flightradar24.com/linux_x86_binaries/fr24feed_1.0.34-0_i386.tgz -O - | tar -xz
    mv fr24feed_i386 fr24feed
fi

if [ "$ARCH" == "aarch64" ]; then
    wget -c https://repo-feed.flightradar24.com/rpi_binaries/fr24feed_1.0.37-0_armhf.tgz -O - | tar -xz
    mv fr24feed_armhf fr24feed
fi
