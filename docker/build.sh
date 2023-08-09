#!/bin/bash
USER_NAME="build"
PROJECT="toeziOS"
LAYER="toezios"

BUILD_INPUT_DIR="/home/$USER_NAME"
BUILD_OUTPUT_DIR="/home/$USER_NAME/output/build"

mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_DIR

cd $BUILD_INPUT_DIR/$PROJECT

git pull --recurse-submodules


TEMPLATECONF=$BUILD_INPUT_DIR/$PROJECT/meta-$LAYER/conf/templates/default \
    source poky/oe-init-build-env $BUILD_OUTPUT_DIR \
    && bitbake toezios-image #--runall=fetch
    



