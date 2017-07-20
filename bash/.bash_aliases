
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

# export PYTHONPATH=$PWD
alias pypa='export PYTHONPATH=$PWD; echo set PYTHONPATH to: $PYTHONPATH'
alias ppwd='export PYTHONPATH=$PWD:${PYTHONPATH}; echo set PYTHONPATH to: $PYTHONPATH'
alias pp_splunk='export PYTHONPATH=$(splunk_env.sh); echo "exported PYTHONPATH =\n$PYTHONPATH" | sed -e "s/:/:\n/g"'

alias bpyvenv='$VIRTUAL_ENV/bin/bpython'  # wrap it in script for error messages

# backend
backend_path="${HOME}/devel/backend"  # backend_root
alias “='workon backend; cd "$backend_path"; export OAUTHLIB_INSECURE_TRANSPORT=1'  # “ = ALT-GR + b
alias ‘='“; ›; “' # ‘ = ALT-GR + SHIFT + b

# splunk_etc
splunk_etc_path="${HOME}/devel/splunk_etc"
alias ſ='workon splunk_etc; splunk_env.sh'

# idealo samba
alias samba='idealo_samba.sh'

alias dm_dev='eval $(docker-machine env dev)'

# cts server
# use .bash_aliases_local
alias cts_server='cts_server.sh'
alias tracker_services='tracker_services.sh'

alias sh01p='ssh search-01.dwh01.pro06.eu.idealo.com'
alias sh02p='ssh search-02.dwh01.pro06.eu.idealo.com'
alias sh03p='ssh search-03.dwh01.pro06.eu.idealo.com'
alias sh04p='ssh search-04.dwh01.pro06.eu.idealo.com'
alias sh05p='ssh search-05.dwh01.pro06.eu.idealo.com'
alias sh01='ssh search-01.dwh01.tst06.eu.idealo.com'
alias sh02='ssh search-02.dwh01.tst06.eu.idealo.com'

alias ts01p='ssh tracking-01.dwh01.pro06.eu.idealo.com'
alias ts02p='ssh tracking-02.dwh01.pro06.eu.idealo.com'
alias ts01='ssh tracking-01.dwh01.tst06.eu.idealo.com'

# random stuff
alias rec='cd ~/devel/splunk_etc/apps/idealo_recalc/bin && source venv_recalc/bin/activate'
alias mark='cd ~/mega/docs/wohnung/markgrafendamm'
alias r2492='cd ~/devel/services/researches/DWH-2492'
