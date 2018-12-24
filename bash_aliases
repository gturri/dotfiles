
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

PS1='[\[\033[01;32m\]\u@\h\[\033[00;35m\]($(date +%H:%M:%S))\[\033[01;34m\]:\w\[\033[00;35m\]'
if which git >/dev/null; then
PS1=$PS1'$(__git_ps1 " (%s)")'
fi
PS1=$PS1'\[\033[00m\]]\$ '

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")
# http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
export LESS_TERMCAP_mb=$'\E[01;31m'    # debut de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # debut de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d'état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin

# Learn a command on each new shell open
man $(ls /usr/bin | shuf -n 1)| sed -n "/^NAME/ { n;p;q }"

# catch a common scp mistake
scp(){ if [[ "$@" =~ : ]];then /usr/bin/scp $@ ; else echo 'You forgot the colon dumbass!'; fi;}
