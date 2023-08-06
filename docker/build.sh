#!/bin/bash
USER_NAME="build"
PROJECT="toeziOS"
LAYER="toezios"

BUILD_INPUT_DIR="/home/$USER_NAME/"
BUILD_OUTPUT_DIR="/home/$USER_NAME/output/"

cd $BUILD_INPUT_DIR/$PROJECT

TEMPLATECONF=$BUILD_INPUT_DIR/$PROJECT/meta-$LAYER/custom/ \
    source poky/oe-init-build-env $BUILD_OUTPUT_DIR \
    && bitbake toezios-image

