#!/bin/bash
if [ -z "$1" ]; then
    echo "cron.dにインストールするファイルを指定してください"
fi

readonly crondPath="/etc/cron.d"
basename=`basename "$1"`
azgrep=`echo $basename | sed -E 's/[0-9a-zA-Z_\.-]//g'`
echo $azgrep
if [ -n "$azgrep" ]; then
	echo -e \
		  " ファイル名に有効な命名がされていません 対象文字[ $azgrep ]\n"\
		  "使用可能文字は[0-9a-zA-Z]です\n"\
		  "記号は[-_]のみ使用可能です\n"\
		  "それ以外は以下の規則で置き換えてシンボリックリンクを作成します\n"\
		  "スペースなどは[_]\n"\
		  "それ以外の命名無効な記号[-]"
	exit 1
fi

crondSymlink=`echo "$basename"     | sed -E 's/\\s/_/g'`
crondSymlink=`echo "$crondSymlink" | sed -E 's/[^0-9a-zA-Z_-]/-/g'`

echo "crondSymlink: $crondSymlink"

if [ -L $crondPath/$crondSymlink ]; then
	echo "remove for exists cron entry $crondPath/$crondSymlink"
	sudo rm -f $crondPath/$crondSymlink
fi

readlinkF=`readlink -f "$1"`
echo "$readlinkF $crondPath/$crondSymlink"
sudo ln -s "$readlinkF" "$crondPath/$crondSymlink"
sudo chown root:root "$readlinkF"
sudo chmod 644       "$readlinkF"
sudo chown root:root "$crondPath/$crondSymlink"
sudo chmod 644       "$crondPath/$crondSymlink"
