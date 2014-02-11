#!/bin/bash
#
# script to get the pwd git commit hash
# this is largely from: https://github.com/raphink/puppet-puppet/blob/a32727935a953fb984169bc21c905c7e1aef5cda/files/config_version_git.sh
#

ENVIRONMENT=$1

gitdir="/etc/puppet/environments/${ENVIRONMENT}/"
hieradir="/etc/puppet/data/${ENVIRONMENT}/"

echo -n "$ENVIRONMENT/"
cd $gitdir && echo -n $(git rev-parse --short HEAD)

cd $gitdir && git diff-files --quiet --ignore-submodules --
[[ $? == 0 ]] || echo -n " [+]"

echo -n "/"
cd $hieradir && echo -n $(git rev-parse --short HEAD)

cd $hieradir && git diff-files --quiet --ignore-submodules --
[[ $? == 0 ]] || echo -n " [+]"

echo
