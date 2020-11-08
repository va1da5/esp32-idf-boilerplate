#!/usr/bin/env bash

echo -n "Enter project name: "

read PROJECT_NAME

cat <<EOF > Makefile
#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := $PROJECT_NAME

include \$(IDF_PATH)/make/project.mk

EOF

cat <<EOF > CMakeLists.txt
# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)

include(\$ENV{IDF_PATH}/tools/cmake/project.cmake)
project($PROJECT_NAME)
EOF

rm -rf bootstrap.sh