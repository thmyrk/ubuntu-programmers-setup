#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install git git-svn gitk kdiff3 git-gui

lfs_version=$( curl -s "https://api.github.com/repos/git-lfs/git-lfs/releases/latest" | awk '/"tag_name": / { match($2, /v(.*)"/, arr); print arr[1] }' ) \
  && wget -O "git-lfs.tar.gz" "https://github.com/git-lfs/git-lfs/releases/download/v$lfs_version/git-lfs-linux-$CPU_ARCHITECTURE-$lfs_version.tar.gz" \
  && tar -xf git-lfs.tar.gz \
  && cd "$(pwd)/git-lfs-$lfs_version" \
  && sudo ./install.sh
