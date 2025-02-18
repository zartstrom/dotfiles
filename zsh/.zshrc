# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

ZSH_CUSTOM="$HOME/dotfiles/zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic-light"

plugins=(gitfast virtualenv virtualenvwrapper pylint rsync python history ssh-agent pip per-directory-history)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# User configuration
setopt interactivecomments

export PATH=$HOME/bin:$HOME/scripts:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
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

# from https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_night.sh
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# kubectl autocomplete
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
alias k=kubectl
alias kiali-ui='kubectl port-forward svc/kiali 20001:20001 -n istio-system'
alias hubble-ui='kubectl port-forward -n kube-system svc/hubble-ui --address 0.0.0.0 --address :: 12000:80'

# justfile
alias .j='just --justfile ~/.justfile --working-directory .'
alias open='xdg-open'

export PATH="$PATH:/home/phil/.local/bin"

export AWS_DEFAULT_SSO_START_URL="https://idealo-login.awsapps.com/start#/"
export AWS_DEFAULT_SSO_REGION="eu-central-1"

export PATH="$PATH:/home/phil/.local/bin"



