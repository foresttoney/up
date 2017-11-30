#!/bin/bash

echo "---------- xcode ----------"

! [ -d "$(xcode-select -p)" ] && xcode-select --install

echo "---------- brew ----------"

! [ -f "$(which brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "---------- git ----------"

! [ -f "$(which git)" ] && brew install git

echo "---------- project ----------"

if ! [ -d ~/Projects ]; then
  mkdir ~/Projects && cd $_
  git clone git@github.com:foresttoney/up.git
  cd ~
fi

declare -a dotfiles=(
  .bash_profile
  .gitconfig
  .slate.js
  .spacemacs
  .vimrc
)

for dotfile in ${dotfiles[*]}; do 
  ln -s "~/Projects/up/dotfiles/$dotfile" ~/
done

echo "---------- applications ----------"

declare -a brew_packages=(
  emojify
  diff-so-fancy
  htop
  git
  imagemagick
  iterm2
  jq
  postgresql
  perl
  python
  python3
  sqlite
  the_silver_searcher
  tree
  unrar
  vim
)

for package in ${brew_packages[*]}; do 
  ! brew ls --versions $package > /dev/null && brew install $package
done

if ! brew ls --versions $package > /dev/null; then
  brew tap d12frosted/emacs-plus
  brew install emacs-plus
  brew linkapps emacs-plus
fi

! brew info cask > /dev/null && brew tap caskroom/cask

declare -a brew_cask_packages=(
  alfred
  caffeine
  charles
  firefox
  font-hasklig
  google-chrome
  postman
  slack
  sequel-pro
  spotify
  sublime-text
  wireshark
)

for package in ${brew_cask_packages[*]}; do 
  if ! brew cask ls --versions $package > /dev/null; then 
    brew cask install $package;
  fi
done

! [ -f ~/.spacemacs  ] && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

if ! ls /Applications | grep Slate > /dev/null; then
  cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz
  cd ~
fi

echo "---------- node ----------"

if ! [ "$(ls -A ~/.nvm/versions/node)" ]; then
  tag_name=$(curl https://api.github.com/repos/creationix/nvm/releases/latest | jq .tag_name)
  tag_name="${tag_name%\"}"
  tag_name="${tag_name#\"}"
  url="https://raw.githubusercontent.com/creationix/nvm/${tag_name}/install.sh"
  curl -o- $url | bash
  nvm install --lts
fi 

declare -a npm_packages=(
  bower
  grunt 
)

for package in ${npm_packages[*]}; do 
  if ! npm list -g | grep $package > /dev/null; then
    npm install -g $package;
  fi
done

echo "---------- purescript ----------"

if ! [ -f "$(which psvm)" ]; then
  npm install -g psvm
  psvm install-latest
  ls -r ~/.nvm/versions | head -2 | awk '{print $9}' | xargs psvm use
fi

! [ -f "$(which pulp)" ] && npm install -g pulp


echo "---------- rust ----------"

! [ -f "$(which rustup)" ] && curl https://sh.rustup.rs -sSf | sh

