# AWS
alias profile="source $HOME/scripts/set_aws_profile.sh"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --col=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -x /usr/bin/lsd ]; then
    alias ls='lsd'
    alias ll='lsd -alF'
    alias la='lsd -A'
    alias l='lsd -CF'
fi

# toggle touchpad
# alias ttp="bash $HOME/scripts/touchpad_toggle.sh"

# convert svg files to png
alias svg2png="bash $HOME/scripts/svg2png.sh"

# alsamixer
alias amx="alsamixer"

# git
alias git_root='cd "$(git rev-parse --show-toplevel)"'
alias gitroot='cd "$(git rev-parse --show-toplevel)"'

# tmux-cssh
alias tx="~/scripts/tmux-cssh.sh"

# export PYTHONPATH=$PWD
alias pypa='export PYTHONPATH=$PWD; echo set PYTHONPATH to: $PYTHONPATH'

alias bpyvenv='$VIRTUAL_ENV/bin/bpython'  # wrap it in script for error messages


alias ipinfo="$HOME/scripts/what_is_my_ip.sh"

alias cat="bat -p"

source "$HOME/.bash_aliases_local"

alias cat="bat -p"
alias token="/usr/bin/cat $HOME/.github/token_work"

alias .j='just --justfile ~/.justfile --working-directory ~'

