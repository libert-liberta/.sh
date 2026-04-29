#!/bin/bash

currentDir=$(pwd)

fileList=()
# fileList+=(".bashrc")
# fileList+=(".bash_aliases")
# fileList+=(".bash_history")
fileList+=(".my.profile")
fileList+=(".my.aliases.profile")

for file in "${fileList[@]}";
do
	if [ -f $file ]; then
		rm ~/$file
		ln -s $currentDir/$file ~/$file
		chmod 755 $file
	fi
done

# dirList=()
# dirList+=("vsnotes")
# dirList+=(".sqltools")

# for dirRow in "${dirList[@]}";
# do
# 	if [ ! -d "~/$dirRow" ]; then
# 		ln -s $currentDir/$dirRow ~/$dirRow
# 		chmod 755 -R ~/$dirRow
# 	fi
# done

