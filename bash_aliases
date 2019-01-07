
#Needed if the shell tries to load completion files lazily
completionFile=/usr/share/bash-completion/completions/git
if [ -f $completionFile ]; then
  source $completionFile
fi
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g


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
alias g='git'
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
alias mvne='mvn eclipse:clean eclipse:eclipse'
alias mvnew='mvn archetype:generate'
alias mvns='mvnskip'
alias mvnskip='mvn -Dmaven.test.skip=true -Dmaven.javadoc.skip'
alias ownc='rm -f ~/owncloud.log && owncloud --logfile ~/owncloud.log --logflush'
alias resource='source ~/.bashrc'
alias v='vim'
alias va=vagrant
alias vO='vim -O'
alias vp='vim -p'
alias wcl='wc -l'
alias xs='cd ..'

GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"
PS1='[\[\033[01;32m\]\u@\h\[\033[0;33m\]($(date +%H:%M:%S))\w$(__git_ps1 " (%s)")\[\033[00m\]]\$ '

# catch a common scp mistake
scp(){ if [[ "$@" =~ : ]];then /usr/bin/scp $@ ; else echo 'You forgot the colon dumbass!'; fi;}
