#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_DIR/vars.sh

docker build \
  -t newit-svn:$GENTOO_VER \
  --build-arg GENTOO_VER=$GENTOO_VER \
  --build-arg uid=$UID \
  $SCRIPT_DIR
