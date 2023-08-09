#!/bin/bash
USER_NAME="build"
PROJECT="toeziOS"
LAYER="toezios"

BUILD_INPUT_DIR="/home/$USER_NAME"
BUILD_OUTPUT_DIR="/home/$USER_NAME/output/build"
BUILD_OUTPUT_DIR_TMP="/home/$USER_NAME/output_tmp/build"

mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_DIR $BUILD_OUTPUT_DIR_TMP

cd $BUILD_INPUT_DIR/$PROJECT

git pull --recurse-submodules

cp -r $BUILD_OUTPUT_DIR/../downloads/* $BUILD_OUTPUT_DIR_TMP/../downloads/
cp -r $BUILD_OUTPUT_DIR/../sstate-cache/* $BUILD_OUTPUT_DIR_TMP/../sstate-cache/

TEMPLATECONF=$BUILD_INPUT_DIR/$PROJECT/meta-$LAYER/conf/templates/default \
    source poky/oe-init-build-env $BUILD_OUTPUT_DIR_TMP \
    && bitbake toezios-image --runall=fetch

cp -r $BUILD_OUTPUT_DIR_TMP/../* $BUILD_OUTPUT_DIR/../
    



