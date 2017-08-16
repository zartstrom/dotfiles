
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# toggle touchpad
alias ttp="bash $HOME/scripts/touchpad_toggle.sh"

# convert svg files to png
alias svg2png="bash $HOME/scripts/svg2png.sh"

# alsamixer
alias amx="alsamixer"

# git
alias git_root='cd "$(git rev-parse --show-toplevel)"'
alias gitroot='cd "$(git rev-parse --show-toplevel)"'

# tmux-cssh
alias tx="tmux-cssh -cs"

# export PYTHONPATH=$PWD
alias pypa='export PYTHONPATH=$PWD; echo set PYTHONPATH to: $PYTHONPATH'
alias ppwd='export PYTHONPATH=$PWD:${PYTHONPATH}; echo set PYTHONPATH to: $PYTHONPATH'
alias pp_splunk='export PYTHONPATH=$(splunk_env.sh); echo "exported PYTHONPATH =\n$PYTHONPATH" | sed -e "s/:/:\n/g"'

alias bpyvenv='$VIRTUAL_ENV/bin/bpython'  # wrap it in script for error messages

# idealo samba
alias samba='idealo_samba.sh'

alias dm_dev='eval $(docker-machine env dev)'

source ~/.bash_aliases_local
