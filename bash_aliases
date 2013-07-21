alias g='git'
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g


alias gikt='gitk'
alias gitc='git reset --hard & git clean -fxd'
alias gitka='gitk --all HEAD &'

alias exi='exit'
alias ownc='rm -f ~/owncloud.log && owncloud --logfile ~/owncloud.log --logflush'
alias xs='cd ..'
alias dush='du -s * | sort -n | cut -f 2 | xargs du -sh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias llh='ls -lh'
alias findnew='find . -mmin -1'
alias gr='grep -rn'
alias chmux='chmod u+x'
