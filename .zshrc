source ~/.zplug/zplug

# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Can manage a plugin as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, of:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", of:zshrc

# Prohibit updates to a plugin by using the "frozen:" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename to use "file:" tag
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    file:fzf, \
    of:"*darwin*amd64*"

# Support oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh, if:"which git"
zplug "themes/robbyrussell", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
zplug "tj/n", do:"make install"

# Support checking out a specific branch/tag/commit of a plugin
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", commit:4c23cb60

# Install if "if:" tag returns true
zplug "hchbaw/opp.zsh", if:"(( ${ZSH_VERSION%%.*} < 5 ))"

# Can manage gist file just like other plugins
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    of:get_last_pane_path.sh

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    as:command, \
    from:bitbucket, \
    do:"chmod 755 *.sh", \
    of:"*.sh"

# Group dependencies, emoji-cli depends on jq in this example
zplug "stedolan/jq", \
    as:command, \
    file:jq, \
    from:gh-r \
    | zplug "b4b4r07/emoji-cli"

# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# Can manage local plugins
zplug "~/.zsh", from:local
# A relative path is resolved with respect to the $ZPLUG_HOME
zplug "repos/robbyrussell/oh-my-zsh/custom/plugins/my-plugin", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# using peco
function vig {
    STR="$1"
    vim $(grep -n ${STR} **/*.go | grep -v "[0-9]:\s*//" | peco | awk -F ":" '{print "-c "$2" "$1}')
}
#function peco-select-history() {
#    local tac
#    if which tac > /dev/null; then
#        tac="tac"
#    else
#        tac="tail -r"
#    fi
#    BUFFER=$(\history -n 1 | \
#        eval $tac | \
#        peco --query "$LBUFFER")
#    CURSOR=$#BUFFER
#    zle clear-screen
#}
#zle -N peco-select-history
#bindkey '^r' peco-select-history

# history
HIST_STAMPS="yyyy/mm/dd"

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/project/bin:$PATH
export GOPATH=$HOME/project

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew use v0.10

# alias
alias gdw="git diff --color-words"
alias ggpull="git pull origin $(current_branch)"
alias ggpush="git push origin $(current_branch)"
alias gh='cd $(ghq list -p | peco)'
alias dstat='dstat -tlamp'

# tmux
alias tmux="LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/tmux"
export EDITOR='vim'



