source /usr/local/share/antigen/antigen.zsh

plugins=(autojump brew command-not-found docker git golang helm kubectl man pip ssh-agent vagrant vault vi-mode xcode yarn)

antigen use oh-my-zsh

for plugin in ${plugins}; do
  antigen bundle $plugin
done

antigen theme robbyrussell

antigen apply

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
