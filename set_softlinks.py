#!/usr/bin/python2
import errno
import os


def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def softlink(source, target):
    try:
        os.symlink(source, target)
        msg = "Created symlink"
        print "%-20s: %s -> %s" % (msg, target, source)
    except OSError, exc:
        if "File exists" in exc:
            msg = "File already exists"
            print "%-20s: %s" % (msg, target)
        else:
            msg = "Unexpected error"
            print "%-20s: %s" % (msg, exc)


def display_header(section):
    print
    print "--- %s ---" % section


HOME = os.environ["HOME"]
DOTFILES = os.path.join(HOME, "dotfiles")


# bash
display_header("bash")
softlink(os.path.join(DOTFILES, "bash/.bashrc"), os.path.join(HOME, ".bashrc"))
softlink(os.path.join(DOTFILES, "bash/.bash_aliases"), os.path.join(HOME, ".bash_aliases"))

# firefox (no Desktop folder please)
display_header("firefox")
mkdir_p(os.path.join(HOME, ".config"))
softlink(os.path.join(DOTFILES, "firefox/user-dirs.dirs"), os.path.join(HOME, ".config/user-dirs.dirs"))

# git
display_header("git")
softlink(os.path.join(DOTFILES, "git/.gitconfig"), os.path.join(HOME, ".gitconfig"))

# i3
display_header("i3")
mkdir_p(os.path.join(HOME, ".config/i3"))
# no I do it with setup_i3_config.sh which is sourced in .xinitc
# softlink $HOME/os.path.join(DOTFILES, "i3/config") $HOME/.config/i3/config
mkdir_p(os.path.join(HOME, ".config/i3status"))
softlink(os.path.join(DOTFILES, "i3/i3status.conf"), os.path.join(HOME, ".config/i3status/config"))

mkdir_p(os.path.join(HOME, "scripts"))
softlink(os.path.join(DOTFILES, "i3/i3exit.sh"), os.path.join(HOME, "scripts/i3exit.sh"))
softlink(os.path.join(DOTFILES, "i3/lock.sh"), os.path.join(HOME, "scripts/lock.sh"))

# pylint
display_header("pylint")
softlink(os.path.join(DOTFILES, "pylint/pylintrc"), os.path.join(HOME, ".pylintrc"))

# scripts
display_header("scripts")
mkdir_p(os.path.join(HOME, "scripts"))
softlink(os.path.join(DOTFILES, "scripts/touchpad_toggle.sh"), os.path.join(HOME, "scripts/touchpad_toggle.sh"))

# vim
display_header("vim")
mkdir_p(os.path.join(HOME, ".vim"))
mkdir_p(os.path.join(HOME, ".vimswap"))
mkdir_p(os.path.join(HOME, ".config/nvim"))
softlink(os.path.join(DOTFILES, "vim/vimrc"), os.path.join(HOME, ".vimrc"))
softlink(os.path.join(DOTFILES, "vim/init.vim"), os.path.join(HOME, ".config/nvim/init.vim"))

# X11
display_header("X11")
softlink(os.path.join(DOTFILES, "X11/.xinitrc"), os.path.join(HOME, ".xinitrc"))
softlink(os.path.join(DOTFILES, "X11/.xprofile"), os.path.join(HOME, ".xprofile"))
softlink(os.path.join(DOTFILES, "X11/.Xresources"), os.path.join(HOME, ".Xresources"))
softlink(os.path.join(DOTFILES, "X11/.Xdefaults"), os.path.join(HOME, ".Xdefaults"))
# mouse config:
softlink(os.path.join(DOTFILES, "X11/.imwheelrc"), os.path.join(HOME, ".imwheelrc"))

# zsh
display_header("zsh")
softlink(os.path.join(DOTFILES, "zsh/.zshrc"), os.path.join(HOME, ".zshrc"))
mkdir_p(os.path.join(HOME, ".oh-my-zsh/themes"))
softlink(os.path.join(DOTFILES, "zsh/af-magic-light.zsh-theme"), os.path.join(HOME, ".oh-my-zsh/themes"))
