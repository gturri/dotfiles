#!/usr/bin/env bash
#
# bootstrap installs things.

#The MIT License
#
#Copyright (c) Zach Holman, http://zachholman.com
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

DOTFILES_ROOT="`pwd`"

info () {
  printf " [ \033[00;34m..\033[0m ] $1"
}

infoLF () {
  info "$1"
  echo ""
}

user () {
  printf "\r [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

print_help(){
  info "Install dotfiles. Optional arguments:"; echo ""
  info "  -h: print this help"; echo ""
  info "  --non-interactive: run in a non interactive mode."; echo ""
  info "  --name=your_name: your name"; echo ""
  info "  --email=your_email: your email"; echo ""
}

nonInteractive=""
name=""
email=""

for i in "$@"; do
  case $i in
    -h|--help)
      print_help
      exit 0
    ;;
    --non-interactive)
      nonInteractive=y
    ;;
    --name=*)
      name=$(echo $i | sed 's/--name=//')
    ;;
    --email=*)
      email=$(echo $i | sed 's/--email=//')
    ;;
  esac
done

if [ -n "$nonInteractive" ]; then
  if [ -z "$name" ]; then
    infoLF "non interactive mode would work better with --name"
  else
    infoLF "will use name: $name";
  fi
  if [ -z "$email" ]; then
    infoLF "non interactive mode would work better with --email"
  else
    infoLF "will use email: $email";
  fi
fi

set -e

echo ''

setup_gitconfig () {
  gitnameCacheFile=.gitconfig.name
  if ! [ -f ${gitnameCacheFile} ]; then
    info 'setup gitconfig'

    if [ -n "$nonInteractive" ]; then
       git_authorname=$name
       git_authoremail=$email
    else
      user ' - What is your github author name?'
      read -e git_authorname
      user ' - What is your github author email?'
      read -e git_authoremail
    fi

    echo "[user]" > ${gitnameCacheFile}
    if [ -n "$git_authorname" ]; then
      echo "  name = $git_authorname" >> ${gitnameCacheFile}
    fi
    if [ -n "$git_authoremail" ]; then
      echo "  email = $git_authoremail" >> ${gitnameCacheFile}
    fi
  fi

  cat ${gitnameCacheFile} gitconfig > .gitconfig
  success 'gitconfig'
}

setup_vimrc(){
  cp -f vimrc .vimrc
}

setup_bashrc(){
  cp -f bash_aliases .bash_aliases
  echo "PATH=\$PATH:$DOTFILES_ROOT/bin" >> .bash_aliases
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

install_dotfiles () {
  info 'installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  if [ -n "$nonInteractive" ]; then
    overwrite_all=true
  fi

  for source in  .bash_aliases .vimrc .gitconfig; do
    source=${DOTFILES_ROOT}/$source
    dest="$HOME/`basename $source`"
  
    if [ -f $dest ] || [ -d $dest ]; then
      overwrite=false
      backup=false
      skip=false
      
      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action
  
        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
  
      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]; then
          rm -rf $dest
          success "removed $dest"
      fi
  
      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]; then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi
  
      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]; then
        link_files $source $dest
      else
        success "skipped $source"
      fi
      
    else
      link_files $source $dest
    fi
  done
}

setup_gitconfig
setup_vimrc
setup_bashrc
install_dotfiles

echo ''
echo ' All installed!'
