#!/bin/bash
USER_NAME="build"
PROJECT="toeziOS"
LAYER="toezios"

BUILD_INPUT_DIR="/home/$USER_NAME/input"
BUILD_OUTPUT_DIR="/home/$USER_NAME/output"
mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_DIR

cd $BUILD_INPUT_DIR
git clone --recurse-submodules https://github.com/toezi/toeziOS.git

cd $BUILD_OUTPUT_DIR
TEMPLATECONF=$BUILD_INPUT_DIR/$PROJECT/meta-$LAYER/custom/
export TEMPLATECONF


source $BUILD_INPUT_DIR/$PROJECT/poky/oe-init-build-env \
    && bitbake $LAYER-image