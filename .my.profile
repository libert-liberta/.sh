# Ubuntu bashのプロンプトHack!!!!（gitブランチ表示)
# https://qiita.com/ryosukue/items/bc1eae639e3950790eb9

endFmt='\[\033[00m\]'
envStr=""
formatDate='\D{%Y/%m/%d} \t'
export PS1="\[\033[00;32m\]\u@${envStr}\h\[\033[00;31m\]"
if [ -f /etc/bash_completion.d/git-prompt ]; then
    export PS1=$PS1$endFmt' \w$(__git_ps1)'" [$formatDate]\n\[\033[00;34m\]\$"
else
    export PS1=$PS1$endFmt" \w [$formatDate]\n\[\033[00;34m\]\$"
fi

export PS1=$PS1$endFmt' '
unset endFmt envStr formatDate

# export PS1='\[\033[00;32m\]\u@\h\[\033[00;33m\]'
# if [ -f /etc/bash_completion.d/git-prompt ]; then
#     export PS1=$PS1'\[\e[00;36m\] \w$(__git_ps1) \n\[\033[00;34m\]\$'
# else
#     export PS1=$PS1'\[\e[00;36m\] \w \n\[\033[00;34m\]\$'
# fi

export PS1=$PS1'\[\033[00m\] '

# リアルタイムに.bash_historyを更新する
export PROMPT_COMMAND='history -a; history -r'

# ignoredups(重複コマンドを保存しない)
# ignorespace（空白でコマンドを保存しない）
# ignoreboth（重複コマンド空白を保存しない）
# erasedups（同一コマンドを無視）
export HISTCONTROL=ignoreboth

# 実行日時の書式を指定
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "

# パスワードマネージャー
if [ -f ~/.password/loadprofile.sh ]; then source ~/.password/loadprofile.sh ; fi

# Docker Config
if [ -f ~/.docker.profile ]; then source ~/.docker.profile ; fi
