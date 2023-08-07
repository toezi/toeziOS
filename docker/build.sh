#!/bin/bash
USER_NAME="build"
PROJECT="toeziOS"
LAYER="toezios"

BUILD_INPUT_DIR="/home/$USER_NAME"
BUILD_OUTPUT_TMP_DIR="/home/$USER_NAME/output/"
BUILD_OUTPUT_DIR="/home/$USER_NAME/output/"

mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_TMP_DIR $BUILD_OUTPUT_DIR

cd $BUILD_INPUT_DIR/$PROJECT

git pull --recurse-submodules

#rm -rf $BUILD_OUTPUT_TMP_DIR/*
#cp -r $BUILD_OUTPUT_DIR/*  $BUILD_OUTPUT_TMP_DIR/*

TEMPLATECONF=$BUILD_INPUT_DIR/$PROJECT/meta-$LAYER/conf/templates/default \
    source poky/oe-init-build-env $BUILD_OUTPUT_TMP_DIR \
    && bitbake toezios-image --runall=fetch
    
#rm -rf $BUILD_OUTPUT_DIR/*
#cp -r $BUILD_OUTPUT_TMP_DIR/tmp/deploy/*  $BUILD_OUTPUT_DIR/


