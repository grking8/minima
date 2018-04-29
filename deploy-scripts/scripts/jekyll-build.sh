#!/usr/bin/env bash

set -xe

mkdir -p _site
echo "jekyll environment variable"
echo $JEKYLL_ENV
jekyll build
