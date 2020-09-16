#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# 入力ファイル名を引き継いだ3世代分の新規空ファイルを作成する。
# CreatedAt: 2020-09-15
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$(dirname "$(dirname "$HERE")")";
	OutFilePath() { echo "$APP_ROOT"'/res/o/yk_oo_'"${1,,}"'_'"$2"'.tsv'; }
	for SEX in m f c mc fc cm cf; do
		for GENERATION in {1..3}; do
			PATH_FILE="$(OutFilePath $SEX $GENERATION)"
			[ ! -f "$PATH_FILE" ] && touch "$PATH_FILE"
		done
	done
}
Run
