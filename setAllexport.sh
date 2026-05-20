#!/usr/bin/env bash

# 引数チェック
if [ -z "$1" ]; then
  echo "ファイルパスを引数に入れてください: $0 path/to/.env"
  exit 1
fi

ENV_FILE="$1"

# ファイル存在チェック
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: ファイルが存在しません: $ENV_FILE"
  exit 1
fi

# すべての変数を自動 export するモードに
set -o allexport

# .env を読み込む
source "$ENV_FILE" && echo "source $ENV_FILE"

# モードを元に戻す
set +o allexport
