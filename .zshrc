: "zgen" && {
  source "${HOME}/.zgen/zgen.zsh"
  if ! zgen saved; then
    echo "Creating a zgen save..."

    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git

    zgen load aws/aws-cli bin/aws_zsh_completer.sh
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions
    zgen load lukechilds/zsh-better-npm-completion
    zgen load docker/cli contrib/completion/zsh/_docker
    zgen load docker/compose contrib/completion/zsh/_docker-compose

    zgen save
  fi
}

: "env" && {
  # zsh
  export PROMPT='[%*]%{$fg_bold[green]%} %{$fg[cyan]%}%c %{$reset_color%}%(?.%{$fg[green]%}.%{$fg[red]%})%B%(!.#.$)%b '
  export HIST_STAMPS="yyyy/mm/dd"
  export EDITOR='vim'
  export HISTSIZE=5000000
  export MANPAGER="col -b -x|vim -"

  # go
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$HOME/go/bin:$PATH
  export PATH=$HOME/project/bin:$PATH
  export GOPATH=$HOME/go:$HOME/project

  # c/c++
  export PATH="/usr/local/opt/llvm/bin:$PATH" # clangd, clangd-format

  # rust
  [ -f ~/.cargo/env ] && source ~/.cargo/env

  # fzf
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  export FZF_DEFAULT_OPTS="--reverse --height ${FZF_TMUX_HEIGHT:-80%} --select-1 --exit-0"
  export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_OPTS='--select-1 --exit-0 --preview "bat --color=always --style=header,grid --line-range :100 {}"'
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # awscli
  [ -f /usr/local/bin/aws_zsh_completer.sh ] && source /usr/local/bin/aws_zsh_completer.sh

  # k8s/docker
  export DOCKER_BUILDKIT=1
  export KREW_NO_UPGRADE_CHECK=1

  # other path
  export PATH="$HOME/.cargo/bin:$PATH"
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
  export PATH=$HOME/.rbenv/shims:$PATH
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
}

: "alias" && {
  alias history='fc -il 1' # for HIST_STAMPS in oh-my-zsh
  alias gdw="git diff --color-words"
  alias gdww="git diff --word-diff-regex=$'[^\x80-\xbf][\x80-\xbf]*' --word-diff=color"
  alias gh='cd $(ghq list -p | peco)'
  alias glogg='git log --graph --name-status --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
  alias glogo='git log --oneline --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
  alias dstat='dstat -tlamp'
  alias rg='rg -S'
  alias grebase='git rebase -i $(git log --date=short --pretty="format:%C(yellow)%h %C(green)%cd %C(blue)%ae %C(red)%d %C(reset)%s" |fzy| cut -d" " -f1)'
  alias gbc="~/dotfiles/bin/git-checkout-remote-branch"
  alias l="exa -lha"
  alias lt="exa -lhTa --ignore-glob '.git|node_modules'"
  alias ltt="exa -Ta --ignore-glob '.git|node_modules'"
  alias nswitch="source ~/.switch-proxy"
  alias tsync="tmux set-window-option synchronize-panes"
  alias batd="bat -l diff"
  alias bats="bat -l sh"
  alias f='fzf --preview "bat --color=always --style=header,grid --line-range :100 {}"'

  # k8s
  alias k="kubectl"
  alias kg="kubectl get"
  alias kgp="kubectl get pods"
  alias ka="kubectl apply -f"
  alias kd="kubectl describe"
  alias krm="kubectl delete"
  alias klo="kubectl logs -f"
  alias kex="kubectl exec -i -t"
  alias kns="kubens"
  alias kctx="kubectx"

  alias py="python3"
  alias vi="vim"
  alias vimf='vim $(fzf)'
  alias vimdiff='nvim -d'
  alias typora='open -a typora'
}

: "completions for k8s" && {

  # kubectl
  if (which kubectl > /dev/null); then
    function kubectl() {
      if ! type __start_kubectl >/dev/null 2>&1; then
          source <(command kubectl completion zsh)
      fi
      command kubectl "$@"
    }
  fi

  # kops
  if (which kops > /dev/null); then
    function kops() {
      if ! type __start_kops >/dev/null 2>&1; then
          source <(command kops completion zsh)
      fi
      command kops "$@"
    }
  fi

  # helm
  if (which helm > /dev/null); then
    function helm() {
      if ! type __start_helm >/dev/null 2>&1; then
          source <(command helm completion zsh)
      fi
      command helm "$@"
    }
  fi

  # eksctl
  if (which eksctl > /dev/null); then
    function eksctl() {
      if ! type __start_eksctl >/dev/null 2>&1; then
          source <(command eksctl completion zsh)
      fi
      command eksctl "$@"
    }
  fi

  # kind
  if (which kind > /dev/null); then
    function kind() {
      if ! type __start_kind >/dev/null 2>&1; then
          source <(command kind completion zsh)
      fi
      command kind "$@"
    }
  fi
}


: "iab" && {
  setopt extended_glob

  typeset -A abbreviations
  abbreviations=(
      "G"        " | grep"
      "vimfx"    "fzy | xargs vim"
  )

  magic-abbrev-expand() {
      local MATCH
      LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
      LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
      zle self-insert

  }

  no-magic-abbrev-expand() {
      LBUFFER+=' '

  }

  zle -N magic-abbrev-expand
  zle -N no-magic-abbrev-expand
  bindkey " " magic-abbrev-expand
  bindkey "^x " no-magic-abbrev-expand
}

: "powered_cd" && {
  function chpwd() {
    powered_cd_add_log
  }
  function powered_cd_add_log() {
    local i=0
    cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ i = 30 ]; then
      sed -i -e "30,30d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
  }
  function powered_cd() {
    if (which tac > /dev/null); then
      tac="tac"
    else
      tac="tail -r"
    fi
    if [ $# = 0 ]; then
      local dir=$(eval $tac ~/.powered_cd.log | fzf)
      if [ "$dir" = "" ]; then
        return 1
      elif [ -d "$dir" ]; then
        cd "$dir"
      else
        local res=$(grep -v -E "^${dir}" ~/.powered_cd.log)
        echo $res > ~/.powered_cd.log
        echo "powerd_cd: deleted old path: ${dir}"
      fi
    elif [ $# = 1 ]; then
      cd $1
    else
      echo "powered_cd: too many arguments"
    fi
  }
  _powered_cd() {
    _files -/
  }
  compdef _powered_cd powered_cd
  [ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log
  alias c="powered_cd"
}

: "peco-snippet" && {
  function peco-select-snippet() {
    BUFFER=$(cat ~/.snippet | peco)
    CURSOR=$#BUFFER
    zle -R -c
  }
  zle -N peco-select-snippet
  bindkey '^x^r' peco-select-snippet
}

: "dstat" && {
  alias dstat-full="dstat -Tclmdrn"  # full
  alias dstat-memory="dstat -Tclm"   # memory
  alias dstat-cpu="dstat -Tclr"      # cpu
  alias dstat-network="dstat -Tclnd" # network
  alias dstat-diskio="dstat -Tcldr"  # diskI/O
}

: "peco-history" && {
  function peco-select-history() {
      emulate -L zsh
      local delimiter=$'\0; \0' newline=$'\n'
      BUFFER=${"$(print -rl ${history//$newline/$delimiter} | peco --query "$LBUFFER")"//$delimiter/$newline}
      CURSOR=$#BUFFER
      zle -Rc
      zle reset-prompt
  }
  zle     -N   peco-select-history
  bindkey '^r' peco-select-history
}

: "fzf-history" && {
  # function fzf-history-widget() {
  #   local selected num
  #   setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  #   selected=( $(fc -rl 1 |
  #     FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  #   local ret=$?
  #   if [ -n "$selected" ]; then
  #     num=$selected[1]
  #     if [ -n "$num" ]; then
  #       zle vi-fetch-history -n $num
  #     fi
  #   fi
  #   zle redisplay
  #   typeset -f zle-line-init >/dev/null && zle zle-line-init
  #   return $ret
  # }
  # zle     -N   fzf-history-widget
  # bindkey '^t' fzf-history-widget
}

: "tmux refresh" && {
  function precmd() {
    if [ ! -z $TMUX ]; then
      tmux refresh-client -S
    fi
  }
}

: "Switch ENV by OSTYPE" && {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    if [[ "$USERNAME" == "vagrant" ]]; then
      # Ubuntu on Vagrant
    fi

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications";
    # curl
    export PATH="/usr/local/opt/curl/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/curl/lib"
    export CPPFLAGS="-I/usr/local/opt/curl/include"
    export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
    # openssl
    export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
    export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
    export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    #
  elif [[ "$OSTYPE" == "msys" ]]; then
    #
  elif [[ "$OSTYPE" == "win32" ]]; then
    #
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    #
  else
    # Unknown.
  fi
}

: "private source" && {
  if [ -e ~/.zshrc.private ]; then
    source ~/.zshrc.private
  fi
}

: "zprof" && {
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
}


