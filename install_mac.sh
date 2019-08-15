#!/bin/bash
set -o pipefail
set -vxeu

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
exec $SHELL -l

brew install \
  go peco wget tmux zsh nkf tree ripgrep fd fzf tig fzy exa \
  python jq git-secrets bat watch ghq git \
  kubectl kubectx kubernetes-helm
brew install python@2
exec $SHELL -l

brew install neovim/neovim/neovim
# brew tap universal-ctags/universal-ctags
# brew install --HEAD universal-ctags --with-libyaml

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
exec $SHELL -l
anyenv install --init
eval "$(anyenv init -)"
exec $SHELL -l

# rbenv and nodenv
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv install nodenv
eval "$(anyenv init -)"
exec $SHELL -l
nodenv install 12.8.0
nodenv rehash
nodenv global 12.8.0
# anyenv install rbenv

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# symlink
cd ~/
git clone https://github.com/tarjoilija/zgen.git ~/.zgen
git clone https://github.com/ktrysmt/dotfiles  ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/peco/
mkdir -p ~/.hammerspoon/
mkdir ~/.cache
mkdir ~/.local
# mkdir ~/.ctags.d
ln -s ~/dotfiles/.snippet ~/.snippet
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.tmux.conf.osx ~/.tmux.conf
ln -s ~/dotfiles/.tern-project ~/.tern-project
ln -s ~/dotfiles/.config/peco/config.json ~/.config/peco/config.json
ln -s ~/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua
# ln -s ~/dotfiles/.ctags ~/.ctags.d/config.ctags
cp ~/dotfiles/.switch-proxy.osx ~/.switch-proxy
cp ~/dotfiles/.gitconfig ~/.gitconfig
# wget -O ~/Library/Fonts/RictyDiminished-Regular.ttf https://github.com/edihbrandon/RictyDiminished/raw/master/RictyDiminished-Regular.ttf
# wget -O ~/dotfiles/.hammerspoon/hyperex.lua https://raw.githubusercontent.com/hetima/hammerspoon-hyperex/master/hyperex.lua
# ln -s ~/dotfiles/.hammerspoon/hyperex.lua ~/.hammerspoon/hyperex.lua
# git secrets
git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'

# go
mkdir -p ~/project/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/go/bin:$HOME/project/bin:$PATH
export GOPATH=$HOME/go:$HOME/project

# nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
pip2 install neovim
pip3 install neovim
ln -sf $(which nvim) /usr/local/bin/vim

# sub tools
go get github.com/golangci/golangci-lint/cmd/golangci-lint
go get golang.org/x/tools/gopls
go get github.com/go-delve/delve/cmd/dlv
vim +":PlugInstall" +":setfiletype go" +":GoInstallBinaries" +qa
npm i -g npm-check-updates neovim

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
brew tap caskroom/cask
brew cask install appcleaner google-japanese-ime iterm2 shiftit hyperswitch clipy docker qblocker hammerspoon visual-studio-code google-chrome 
brew cask install virtualbox
brew cask install vagrant

#brew cask install flux alfred itsycal keybase

#or use 'https://s3.amazonaws.com/LACRM_blog/createGcApp.dmg'

# "Rested tasks"
sudo sh -c "echo $(which zsh) >> /etc/shells";
chsh -s $(which zsh)

