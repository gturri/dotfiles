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

alias apacherestart='sudo /etc/init.d/apache2 restart'
alias c='cd'
alias c-='cd -'
alias chmux='chmod u+x'
alias dush='du -sh * | sort -h'
alias exi='exit'
alias findnew='find . -mmin -1'
alias findf='find . -type f'
alias gr='grep -rn --color'
alias grepi='grep -i'
alias grepv='grep -v'
alias hfs='hadoop fs'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias lltr='ls -ltr'
alias ls1='ls -1'
alias lsR='ls -R'
alias mkdirp='mkdir -p'
alias monoVerboseOn='export MONO_LOG_LEVEL=debug'
alias monoVerboseOff='unset MONO_LOG_LEVEL'
alias mvnew='mvn archetype:generate'
alias mvns='mvnskip'
alias mvnskip='mvn -Dmaven.test.skip=true -Dmaven.javadoc.skip'
alias ownc='rm -f ~/owncloud.log && owncloud --logfile ~/owncloud.log --logflush'
alias resource='source ~/.bashrc'
alias v='vim'
alias va=vagrant
alias vO='vim -O'
alias vp='vim -p'
alias xs='cd ..'

PS1='[\[\033[01;32m\]\u@\h\[\033[00;35m\]($(date +%H:%M:%S))\[\033[01;34m\]:\w\[\033[00;35m\]'
if which git >/dev/null; then
PS1=$PS1'$(__git_ps1 " (%s)")'
fi
PS1=$PS1'\[\033[00m\]]\$ '

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

