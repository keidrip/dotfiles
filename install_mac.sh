#!/bin/bash
set -o pipefail
set -e

# type it before running `sudo :`

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install \
  go peco wget tmux zsh nkf tree ripgrep fd fzf tig fzy exa \
  python jq git-secrets bat watch ghq git diff-so-fancy \
  kubectl kubectx kubernetes-helm coreutils
brew install tldr-pages/tldr/tldr
brew install neovim/neovim/neovim
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags --with-libyaml
exec $SHELL -l

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
exec $SHELL -l
anyenv install --init
eval "$(anyenv init -)"
exec $SHELL -l

# nodenv
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv install nodenv
eval "$(anyenv init -)"
exec $SHELL -l
nodenv install 12.8.0
nodenv rehash
nodenv global 12.8.0
exec $SHELL -l

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
# setting up of rust components is here: https://gist.github.com/ktrysmt/9601264b37f8e46cad1e7075850478fb

# symlink
cd ~/
git clone https://github.com/tarjoilija/zgen.git ~/.zgen
git clone https://github.com/ktrysmt/dotfiles  ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/peco/
mkdir -p ~/.hammerspoon/
mkdir ~/.cache
mkdir ~/.local
ln -s ~/dotfiles/.snippet ~/.snippet
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
# ln -s ~/dotfiles/.tmux.conf.osx ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf.osx.v2.9 ~/.tmux.conf
ln -s ~/dotfiles/.tern-project ~/.tern-project
ln -s ~/dotfiles/.config/peco/config.json ~/.config/peco/config.json
ln -s ~/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua
cp ~/dotfiles/.gitconfig ~/.gitconfig
# cp ~/dotfiles/.switch-proxy.osx ~/.switch-proxy
mkdir -p ~/.ipython/profile_default/
echo "c.InteractiveShell.colors = 'Linux'" > ~/.ipython/profile_default/ipython_config.py

# git config
git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'
git config --global credential.helper osxkeychain
git config --global user.name "ktrysmt"
git config --global user.email "kotaro.yoshimatsu@gmail.com"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

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
pip3 install neovim
ln -sf $(which nvim) /usr/local/bin/vim
pip3 install 'python-language-server[yapf]'
pip3 install ipdb

# k8s
(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/download/v0.3.3/krew.{tar.gz,yaml}" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" &&
  "$KREW" install --manifest=krew.yaml --archive=krew.tar.gz &&
  "$KREW" update
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# sub tools
go get github.com/golangci/golangci-lint/cmd/golangci-lint
go get golang.org/x/tools/gopls
go get github.com/go-delve/delve/cmd/dlv
vim +":PlugInstall" +":setfiletype go" +":GoInstallBinaries" +qa
# npm i -g yaml-language-server
npm i -g npm-check-updates neovim

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
brew tap caskroom/cask
brew cask install appcleaner kindle hiddenbar google-japanese-ime iterm2 shiftit hyperswitch clipy docker qblocker hammerspoon visual-studio-code google-chrome typora minikube
brew cask install virtualbox
brew cask install vagrant
brew cask install karabiner-elements
brew cask install michaelvillar-timer
brew cask install smcfancontrol

# the other
cp -Rp /System/Library/CoreServices/ScreenSaverEngine.app /Applications/lock.app

# the final task
sudo sh -c "echo $(which zsh) >> /etc/shells";
chsh -s $(which zsh)

# cica font: https://github.com/miiton/Cica/releases
