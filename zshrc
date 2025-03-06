[[ -e ~/.cache/zsh ]] || mkdir ~/.cache/zsh
export ZSH_CACHE_DIR=~/.cache/zsh
# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

# User configuration

export EDITOR='nvim'

# Set personal aliases
alias vim=nvim
alias vi=nvim


# go
export GOPATH=$HOME/dev/go
PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python3 4 lyfe
alias python=python3
alias pip=pip3

# pip --user installed binaries
PATH=$PATH:$HOME/.local/bin

# spacemacs time
alias emacs=/usr/local/bin/emacsclient

#kubeconfigs
# update_kubeconfigs() {
#   export KUBECONFIG="$(find $HOME/.kube/config.d -maxdepth 1 -type f | tr '\n' ':')$HOME/.kube/config"
# }
# update_kubeconfigs

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# zplug screws up history setup?
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

source $HOME/.local/zshrc

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/ted.wexler/.zshrc'
export FPATH="/usr/local/share/zsh-completions:$FPATH"
export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

autoload -Uz compinit
compinit
autoload -Uz +X bashcompinit && bashcompinit
# End of lines added by compinstall

# the day i can stop using `docker` will be a happy one
export DOCKER_CLI_HINTS=false

