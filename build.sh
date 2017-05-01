#!/bin/bash 

declare MAJOR_VERSION=0
declare MINOR_VERSION=0
declare PATCH_VERSION=3

docker build \
    -t bowhan/buildessential:v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION} \
    -t bowhan/buildessential:latest \
    $(dirname $(readlink -f $0)) \
&& docker push bowhan/buildessential:v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION} \
&& docker push bowhan/buildessential:latest
