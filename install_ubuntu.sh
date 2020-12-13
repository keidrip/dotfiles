#!/bin/bash

set -o pipefail
set -e

read -p "password? > " PASSWORD

# linuxbrew
sudo apt-get -qq -y update
sudo apt-get -qq -y install build-essential curl file git zsh nodejs
export CI=true
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# brew
brew install \
  go \
  peco \
  wget \
  tmux \
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
  llvm \
  neovim
# brew install --HEAD universal-ctags/universal-ctags/universal-ctags # install failed
exec $SHELL -l

# symlink
# sudo ln -s `which zsh` /usr/bin/zsh
cd ~/
mkdir ~/.zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
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
ln -s ~/dotfiles/.tmux.conf.ubuntu ~/.tmux.conf
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

# rust
# setting up of rust components is here: https://gist.github.com/ktrysmt/9601264b37f8e46cad1e7075850478fb
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
curl -fsSL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux.gz -o ~/.local/bin/rust-analyzer.gz && \
  gunzip ~/.local/bin/rust-analyzer.gz \
  chmod +x ~/.local/bin/rust-analyzer;

# node
sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt-get -qq -y install nodejs

# go
mkdir -p ~/project/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/go/bin:$HOME/project/bin:$PATH
export GOPATH=$HOME/go:$HOME/project

# nvim
mkdir -p ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
pip3 install neovim
sudo ln -sf $(which nvim) $(which vim)
pip3 install 'python-language-server[yapf]'
pip3 install ipdb # python debugger

# sub tools
go get github.com/go-delve/delve/cmd/dlv
vim +":PlugInstall" +":setfiletype go" +":GoInstallBinaries" +qa
vim +"set ft=go" +":LspInstallServer gopls" +qa
vim +"set ft=go" +":LspInstallServer golangci-lint-langserver" +qa
vim +"set ft=rust" +":LspInstallServer rust-analyzer" +qa
sudo npm i -g npm-check-updates neovim

# the final task
sudo bash -c "echo $(which zsh) >> /etc/shells";
echo $PASSWORD | chsh -s $(which zsh)
