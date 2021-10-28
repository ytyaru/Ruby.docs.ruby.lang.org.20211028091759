#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# typeprof
# CreatedAt: 2021-10-23
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	typeprof a.rb > a.rbs
}
Run "$@"
