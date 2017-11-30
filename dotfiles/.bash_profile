export PATH=\
$PATH:\
~/bin:\
~/.psvm/current/bin:\
~/.local/bin:\
~/.psvm/current/bin:\
~/Applications/Charles.app/Contents/MacOS:\
~/.cargo/bin:\
~/Library/Python/2.7/bin:\
/usr/local/mysql/bin:\

export PS1="\u@\h =<< "

alias ..="cd .."
alias ls="ls -lhG"
alias ll="ls -alhG"
llp() { ls -alhG "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}'; }
alias mkdir="mkdir -pv"

function tab_title {
  echo -ne "\033]0;"$*"\007"
}

source ~/.nvm/nvm.sh
[ -s "/Users/foresttoney/.nvm/bash_completion" ] && \. "/Users/foresttoney/.nvm/bash_completion"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
