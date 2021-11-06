#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# Rubyスクリプトを実行する。
# CreatedAt: 2021-11-06
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	echo -e "abc\n山田" | ruby ./0.rb
	ruby ./0.rb ./0.txt
	ruby ./0.rb ./0.txt ./1.txt
# ARGF.argv
# No such file or directory @ rb_sysopen ... (Errno::ENOENT)
#	ruby ./0.rb --flag ./0.txt
#	ruby ./0.rb --option opt-value ./0.txt
#	ruby ./0.rb subcommand --option opt-value ./0.txt
}
Run "$@"
