#!/usr/bin/env bash
set -o errexit
set -o pipefail

error() {
  local parent_lineno="$1"
  local message="$2"
  local code="${3:-1}"
  if [[ -n "$message" ]] ; then
    echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
  else
    echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
  fi
  exit "${code}"
}
trap 'error ${LINENO}' ERR

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_DIR/vars.sh

if [ -z "$NEWIT_SVN_HOME_DIR" ]; then
    NEWIT_SVN_HOME_DIR=$SCRIPT_DIR/.subversion
fi

# creating folders under user permissions
mkdir -p $NEWIT_SVN_HOME_DIR

case $1 in
'--shell')
    COMMAND=bash
    ;;
*)
    ENTRYPOINT="bash -c"
    COMMAND="svn --username=$NEWIT_SVN_USER --password=$NEWIT_SVN_PWD $@"
    ;;
esac

docker run --rm -it \
    -v $NEWIT_SVN_HOME_DIR:/home/newit/.subversion \
    -v $SCRIPT_DIR:/newit \
    -w /newit \
    $DOCKER_FLAGS \
    newit-svn:$GENTOO_VER \
    $ENTRYPOINT \
    "$COMMAND"
