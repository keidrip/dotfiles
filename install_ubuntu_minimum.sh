#!/bin/bash

set -o pipefail
set -vxeu

# linuxbrew
sudo apt-get -qq -y update
sudo apt-get -qq -y install build-essential curl file git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# brew
brew install \
  go \
  peco \
  wget \
  tmux \
  zsh \
  nkf \
  tree \
  ripgrep \
  fd \
  procs \
  fzf \
  tig \
  fzy \
  exa \
  python \
  jq \
  git-secrets \
  bat \
  watch \
  ghq \
  git \
  diff-so-fancy \
  kind \
  kubectl \
  kubectx \
  kubernetes-helm \
  coreutils \
  llvm
brew install neovim/neovim/neovim
brew install --HEAD universal-ctags/universal-ctags/universal-ctags --with-libyaml
exec $SHELL -l

# rust
# setting up of rust components is here: https://gist.github.com/ktrysmt/9601264b37f8e46cad1e7075850478fb
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# symlink
cd ~/
git clone https://github.com/tarjoilija/zgen.git ~/.zgen
git clone https://github.com/ktrysmt/dotfiles  ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/peco/
mkdir ~/.cache
mkdir ~/.local
mkdir ~/.docker
ln -s ~/dotfiles/.snippet ~/.snippet
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.tmux.conf.osx ~/.tmux.conf
ln -s ~/dotfiles/.config/peco/config.json ~/.config/peco/config.json
cp ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.docker/config.json ~/.docker/config.json
mkdir -p ~/.ipython/profile_default/
echo "c.InteractiveShell.colors = 'Linux'" > ~/.ipython/profile_default/ipython_config.py

# git config
git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'
git config --global credential.helper store

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
pip3 install ipdb # python debugger

# sub tools
go get github.com/go-delve/delve/cmd/dlv
vim +":PlugInstall" +":setfiletype go" +":GoInstallBinaries" +qa
vim +":LspInstallServer gopls" +":LspInstallServer golangci-lint-langserver" +":LspInstallServer rust-analyzer" +qa
npm i -g npm-check-updates neovim

# the final task
sudo sh -c "echo $(which zsh) >> /etc/shells";
chsh -s $(which zsh)
