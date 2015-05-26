export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR=vim
export PAGER=less
export LESS='-iMRx4 -FX'
export HISTCONTROL=ignoredups

export PLAIN_JAVASCRIPTS=true
export PLAIN_STYLESHEETS=true
export EVENT_NOKQUEUE=1
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export WEB=/web

alias get-current-branch="git branch 2>/dev/null | grep '^*' | colrm 1 2"
alias get-current-color="if [[ \$(get-current-branch) == \"master\" ]] ; then echo \"1;33m\" ; else echo \"0m\" ; fi"

if [[ ${EUID} == 0 ]] ; then
   export PS1='\[\033[01m\][ \[\033[01;31m\]\u@\h \[\033[00m\]\[\033[01m\]] \[\033[01;32m\]\w\[\033[00m\]\n\[\033[01;31m\]$\[\033[00m\] $(get-current-color)> '
else
  export PS1='\[\033[01m\][ \[\033[01;34m\]\u@\h \[\033[00m\]\[\033[01m\]] \[\033[01;32m\]\w\[\033[00m\]\n\[\033[01;34m\]$\[\033[00m\] $(get-current-color)> '
fi

gitsetproxy() {
  git config --global http.proxy http://<PROXY_HERE>
  git config --global http.sslverify false
}

gitunsetproxy() {
  git config --global --unset http.proxy
  git config --global http.sslverify true
}
