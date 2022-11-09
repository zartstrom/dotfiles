# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic-light"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# pyenv
# Need to put this configuration before the plugin is loaded.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast virtualenv virtualenvwrapper pyenv pylint rsync python history ssh-agent bower pip npm per-directory-history)

# User configuration
setopt interactivecomments

export PATH=$HOME/bin:$HOME/scripts:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>"'

source $HOME/.bash_aliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# set default editor to nvim, some applications use this envvar
export EDITOR=nvim

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# golang
export GOPATH=$HOME/go
export PATH=$PATH:~/go/bin

# hdfs
export PATH=$PATH:/usr/lib/hadoop/bin

# java
export JAVA_HOME=/usr/lib/jvm/default

# kubernetes
export PATH="${PATH}:${HOME}/.krew/bin"


# ruby
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
export PATH=$PATH:~/.gem/ruby/2.4.0/bin

# spark
export PATH=$PATH:/home/phil/spark/bin

# shasum from perl
export PATH=$PATH:/usr/bin/core_perl


# keys
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# HISTORY
#set history size
export HISTSIZE=1000000
#save history after logout
export SAVEHIST=1000000
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY


# Configuring fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
 [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
 [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

autoload -U +X bashcompinit && bashcompinit

# kubectl autocomplete
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
alias k=kubectl
alias kiali-ui='kubectl port-forward svc/kiali 20001:20001 -n istio-system'
alias hubble-ui='kubectl port-forward -n kube-system svc/hubble-ui --address 0.0.0.0 --address :: 12000:80'

# justfile
alias .j='just --justfile ~/.justfile --working-directory .'
alias open='xdg-open'

source ~/devel/recalc-service/.complete.zsh

# Created by `pipx` on 2021-11-12 12:16:40
export PATH="$PATH:/home/phil/.local/bin"

export AWS_DEFAULT_SSO_START_URL="https://idealo-login.awsapps.com/start#/"
export AWS_DEFAULT_SSO_REGION="eu-central-1"
# export AWS_PROFILE="pro"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Created by `pipx` on 2021-11-17 15:22:26
export PATH="$PATH:/home/phil/.local/bin"
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# START: Added by Updated Airflow Breeze autocomplete setup
source /home/phil/devel/airflow/dev/breeze/autocomplete/breeze-complete-zsh.sh
# END: Added by Updated Airflow Breeze autocomplete setup
eval "$(pyenv virtualenv-init -)"
