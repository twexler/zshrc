source $HOME/.bin/zplug/init.zsh

plugins=(autojump brew command-not-found docker git golang helm kubectl man pip ssh-agent vagrant vault vi-mode xcode yarn)

for plugin in $plugins; do
  zplug "plugins/${plugin}", from:oh-my-zsh
done;

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# Load theme file
# zplug 'themes/robbyrussell', from:oh-my-zsh, as:theme, defer:3
zplug "denysdovhan/spaceship-prompt", as:theme, use:"spaceship.zsh"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=nvim
alias vi=nvim
#alias npm=yarn


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

# terraform version management
source /usr/local/opt/chtf/share/chtf/chtf.sh

# spacemacs time
alias emacs=/usr/local/bin/emacsclient

#miniconda
export PATH=/Users/twexler/.miniconda3/bin:$PATH

#kubeconfigs
update_kubeconfigs() {
  export KUBECONFIG="$(find $HOME/.kube/config.d -type f | tr '\n' ':')$HOME/.kube/config"
}
update_kubeconfigs

source ~/.local/zshrc
