
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

# backend
backend_path="${HOME}/devel/backend"  # backend_root
alias “='workon backend; cd "$backend_path"; export OAUTHLIB_INSECURE_TRANSPORT=1'  # “ = ALT-GR + b
alias ‘='“; ›; “' # ‘ = ALT-GR + SHIFT + b

# splunk_etc
splunk_etc_path="${HOME}/devel/splunk_etc"
alias ſ='workon splunk_etc; splunk_env.sh'

# idealo samba
alias samba='idealo_samba.sh'

alias dwh_tunnel='ssh -L 3307:localhost:3306 phitzler@dwhdev01.inf00.inf.bm.loc'

alias dm_dev='eval $(docker-machine env dev)'

# cts server
# use .bash_aliases_local
alias cts_server='cts_server.sh'
alias tracker_services='tracker_services.sh'

alias dwhtv='ssh dwhtv@172.29.0.52'

alias sh01='ssh splunk@sh01.splunk.lvl.bln'
alias sh02='ssh splunk@sh02.splunk.lvl.bln'
alias sh03='ssh splunk@sh03.ipx'
alias sh04='ssh splunk@sh04.ipx'
alias sh-test01='ssh splunk@sh-test01.splunk.lvl.bln'
alias sh-test02='ssh splunk@sh-test02.splunk.lvl.bln'
alias rec='cd ~/devel/splunk_etc/apps/idealo_traffic_jobs/bin/isg_recalculation && source venv_recalc/bin/activate'

alias bpyvenv='$VIRTUAL_ENV/bin/bpython'  # wrap it in script for error messages

alias mark='cd ~/mega/docs/wohnung/markgrafendamm'

