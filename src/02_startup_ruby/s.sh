#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# erb
# CreatedAt: 2021-10-23
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	echo '1'
	ruby -s ./s1.rb -xyz
	echo '2'
	ruby -s ./s2.rb
}
Run "$@"
