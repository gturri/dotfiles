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

alias exi='exit'
alias ownc='rm -f ~/owncloud.log && owncloud --logfile ~/owncloud.log --logflush'
alias c='cd'
alias xs='cd ..'
alias dush='du -s * | sort -n | cut -f 2 | xargs du -sh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias llh='ls -lh'
alias ls1='ls -1'
alias lltr='ls -ltr'
alias findnew='find . -mmin -1'
alias gr='grep -rn'
alias chmux='chmod u+x'
alias resource='source ~/.bashrc'
alias v='vim'
