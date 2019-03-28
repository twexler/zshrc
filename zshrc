source $HOME/.bin/zplug/init.zsh

plugins=(autojump brew command-not-found docker git golang helm kubectl man pip ssh-agent vagrant vault vi-mode xcode yarn)

for plugin in $plugins; do
  zplug "plugins/${plugin}", from:oh-my-zsh
done;

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# Load theme file
zplug 'themes/robbyrussell', from:oh-my-zsh, as:theme, defer:3
# zplug "denysdovhan/spaceship-prompt", as:theme, use:"spaceship.zsh"

# spaceship config
# SPACESHIP_PROMPT_ORDER=(time dir git golang docker venv kubecontext vi_mode jobs exit_code char)
# SPACESHIP_SEPARATE_LINE=false
# SPACESHIP_PROMPT_ADD_NEWLINE=false

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# User configuration

export EDITOR='nvim'

# Set personal aliases
alias vim=nvim
alias vi=nvim


# go
export GOPATH=$HOME/dev/go
PATH=$PATH:$GOPATH/bin
# goenv
export GOENV_ROOT=$HOME/.goenv
PATH=$PATH:$GOENV_ROOT/bin
source <(goenv init -)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python3 4 lyfe
alias python=python3
alias pip=pip3

# pip --user installed binaries
PATH=$PATH:$HOME/.local/bin

# spacemacs time
alias emacs=/usr/local/bin/emacsclient

#kubeconfigs
update_kubeconfigs() {
  export KUBECONFIG="$(find $HOME/.kube/config.d -type f | tr '\n' ':')$HOME/.kube/config"
}
update_kubeconfigs

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# zplug screws up history setup?
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

source $HOME/.local/zshrc
