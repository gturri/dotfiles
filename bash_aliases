alias g='git'

#Needed if the shell tries to load completion files lazily
completionFile=/usr/share/bash-completion/completions/git
if [ -f $completionFile ]; then
  source $completionFile
fi
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g


alias gikt='gitk'
alias gitc='git reset --hard & git clean -fxd'
alias gitka='gitk --all HEAD &'

alias c='cd'
alias chmux='chmod u+x'
alias dush='du -s * | sort -n | cut -f 2 | xargs du -sh'
alias exi='exit'
alias findnew='find . -mmin -1'
alias gr='grep -rn --color'
alias grepi='grep -i'
alias grepv='grep -v'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias lltr='ls -ltr'
alias ls1='ls -1'
alias lsR='ls -R'
alias mkdirp='mkdir -p'
alias ownc='rm -f ~/owncloud.log && owncloud --logfile ~/owncloud.log --logflush'
alias resource='source ~/.bashrc'
alias v='vim'
alias vp='vim -p'
alias xs='cd ..'
