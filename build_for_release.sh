#!/bin/bash

BUILD_FOLDER=build
ADDON_NAME=insert_symbols

EXCLUDES=".|..|build|*.sh|.git|.gitignore|README.md"

if [ -d $BUILD_FOLDER ]; then
  rm -rf $BUILD_FOLDER/*
else
  mkdir $BUILD_FOLDER
fi

mkdir $BUILD_FOLDER/$ADDON_NAME

shopt -s nullglob
shopt -s extglob

for i in !($EXCLUDES); do
  cp $i $BUILD_FOLDER/$ADDON_NAME/$i
done

py_fname=$(echo $ADDON_NAME | tr '_' ' ' | sed 's/\b[a-z]/\u&/g')

echo "import $ADDON_NAME.$ADDON_NAME" > "$BUILD_FOLDER/$py_fname.py"

