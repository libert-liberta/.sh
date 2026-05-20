#!/bin/bash

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias shutdown-wsl='wsl.exe --shutdown'
alias wsl--shutdown='wsl.exe --shutdown'

alias setAllexport='~/.sh/setAllexport.sh'

alias claudeccr='~/.claude-code-router/ccrClaude.sh'
alias chouwnModClaude='~/.claude-code-router/chouwnmodClaude.sh'

function ptinker()
{
	if [ -n "$1" ]; then
		if [ -f artisan ];then
			tail -n +2 $1 | php artisan tinker
		else
			echo "not found artisan command"
		fi
	else
		echo "please php file args";
	fi
}

function codeOpenGitDiff()
{
	files=()
	files+=(`git diff --staged --name-only`)
	for file in ${files[@]}
	do
		code $file
	done
}