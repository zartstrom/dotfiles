#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
account    include      system-local-login
session    include      system-local-login
password   include      system-local-login
# Next two entries taken from https://superuser.com/a/141232
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
