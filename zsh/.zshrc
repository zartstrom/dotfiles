# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic-light"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump git gitfast virtualenv virtualenvwrapper pyenv pylint rsync python history ssh-agent bower pip npm per-directory-history)

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

# justfile
alias .j='just --justfile ~/.justfile --working-directory .'

source ~/devel/recalc-service/.complete.zsh

