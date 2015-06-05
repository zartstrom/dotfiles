
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

# git
alias git_root='cd "$(git rev-parse --show-toplevel)"'

# export PYTHONPATH=$PWD
alias pypa='export PYTHONPATH=$PWD; echo $PYTHONPATH'

# bm20 payment
# export SETTINGS_FILE=/home/philipp/bettermarks/configs/settings.ini
# export I18N_GATE=de
# export DJANGO_SETTINGS_MODULE=bettermarks.settings
# export PYTHONPATH=$PWD
bm20_payment_path="${HOME}/devel/2.0_payment"
alias »pay='(cd "$bm20_payment_path"; workon 2.0_payment; python bettermarks/manage.py runserver 8001 2>&1)'
payment20() {
    export SETTINGS_FILE=/home/philipp/bettermarks/configs/settings.ini
    export I18N_GATE=de
    export DJANGO_SETTINGS_MODULE=bettermarks.settings
    export PYTHONPATH=$PWD
    cd "$bm20_payment_path" && workon 2.0_payment && python bettermarks/manage.py runserver 8001 2>&1
}

# backend
backend_path="${HOME}/devel/backend"  # backend_root
alias “='workon backend; cd "$backend_path"; export OAUTHLIB_INSECURE_TRANSPORT=1'  # “ = ALT-GR + b
alias ‘='“; ›; “' # ‘ = ALT-GR + SHIFT + b

# frontend
frontend_path="${HOME}/devel/frontend"  # frontend_root
alias đ='workon frontend; cd "$frontend_path"'  # đ = ALT-GR + f
alias ª='đ; ›; đ' # ª = ALT-GR + SHIFT + f

# glue
glue_path="${HOME}/devel/glue_all/bm-glue"
alias ŋ='workon glue; cd "$glue_path"'  # ŋ = ALT-GR + g
alias Ŋ='ŋ; ›; ŋ'  # Ŋ = ALT-GR + SHIFT + b

# dwh_nsp
dwh_nsp_path="${HOME}/devel/dwh_nsp"
alias ð='cd ${dwh_nsp_path}'

# payment_ui
# payment_path="${HOME}/devel/payment_ui"
# alias þ='workon payment_ui; cd "$payment_path"'  # þ = ALT-GR + p
# alias Þ='þ; ›; þ'  # Þ = ALT-GR + SHIFT + p


alias glue_st='glue_status.sh'
alias glue_pull='glue_pull.sh'
alias glue_push='glue_push.sh'
alias glue_dev='glue_develop.sh'

alias dwh_tunnel='ssh -L 3307:localhost:3306 phitzler@dwhdev01.inf00.inf.bm.loc'
