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


def mkdir_p_from_home(path):
    mkdir_p(os.path.join(HOME, path))


def create_softlink(source, target):
    try:
        os.symlink(source, target)
        msg = "Created symlink"
        print "%-20s: %s -> %s" % (msg, target, source)
    except OSError, exc:
        # TODO: check if file is the desired softlink or some other file
        if "File exists" in exc:
            msg = "File already exists"
            print "%-20s: %s" % (msg, target)
        else:
            msg = "Unexpected error"
            print "%-20s: %s" % (msg, exc)


def softlink_dotfiles_home(path_from_dotfiles, path_from_home):
    source = os.path.join(DOTFILES, path_from_dotfiles)
    target = os.path.join(HOME, path_from_home)
    create_softlink(source, target)


def softlink_pattern(source_path_dotfiles, target_path_home, extension="txt"):
    source_path = os.path.join(DOTFILES, source_path_dotfiles)
    target_path = os.path.join(HOME, target_path_home)
    files = [f for f in os.listdir(source_path) if f.endswith(extension)]
    for file_ in files:
        source = os.path.join(source_path, file_)
        target = os.path.join(target_path, file_)
        create_softlink(source, target)


def display_header(section):
    print
    print "--- %s ---" % section


HOME = os.environ["HOME"]
DOTFILES = os.path.join(HOME, "dotfiles")


# bash
display_header("bash")
softlink_dotfiles_home("bash/.bashrc", ".bashrc")
softlink_dotfiles_home("bash/.bash_aliases", ".bash_aliases")

# firefox (no Desktop folder please)
display_header("firefox")
mkdir_p_from_home(".config")
softlink_dotfiles_home("firefox/user-dirs.dirs", ".config/user-dirs.dirs")

# fonts
display_header("fonts")
mkdir_p_from_home(".local/share/fonts")
softlink_pattern("fonts", ".local/share/fonts", "ttf")

# git
display_header("git")
softlink_dotfiles_home("git/.gitconfig", ".gitconfig")

# gtk
display_header("gtk")
mkdir_p_from_home(".config/gtk-2.0")
mkdir_p_from_home(".config/gtk-3.0")
softlink_dotfiles_home("gtk/gtkrc", ".config/gtk-2.0/gtkrc")
softlink_dotfiles_home("gtk/settings.ini", ".config/gtk-3.0/settings.ini")

# i3
display_header("i3")
mkdir_p_from_home(".config/i3")
mkdir_p_from_home(".config/i3status")
softlink_dotfiles_home("i3/i3status.conf", ".config/i3status/config")

mkdir_p_from_home("scripts")
softlink_dotfiles_home("i3/i3exit.sh", "scripts/i3exit.sh")
softlink_dotfiles_home("i3/lock.sh", "scripts/lock.sh")
softlink_dotfiles_home("i3/from_here.sh", "scripts/from_here.sh")

# pylint
display_header("pylint")
softlink_dotfiles_home("pylint/pylintrc", ".pylintrc")

# sbt
display_header("sbt")
mkdir_p_from_home(".sbt/0.13/plugins")
softlink_dotfiles_home("sbt/plugins.sbt", ".sbt/0.13/plugins/plugins.sbt")

# scala
display_header("scala")
mkdir_p_from_home(".config/scalafmt")
softlink_dotfiles_home("scala/.scalafmt.conf", ".config/scalafmt/.scalafmt.conf")

# scripts
display_header("scripts")
mkdir_p_from_home("scripts")
softlink_dotfiles_home("scripts/touchpad_toggle.sh", "scripts/touchpad_toggle.sh")
softlink_dotfiles_home("scripts/svg2png.sh", "scripts/svg2png.sh")

# vim
display_header("vim")
mkdir_p_from_home(".vim")
mkdir_p_from_home(".vimswap")
mkdir_p_from_home(".config/nvim")
softlink_dotfiles_home("vim/vimrc", ".vimrc")
softlink_dotfiles_home("vim/init.vim", ".config/nvim/init.vim")

# X11
display_header("X11")
softlink_dotfiles_home("X11/.xinitrc", ".xinitrc")
softlink_dotfiles_home("X11/.xprofile", ".xprofile")
softlink_dotfiles_home("X11/.Xresources", ".Xresources")
softlink_dotfiles_home("X11/.Xdefaults", ".Xdefaults")
softlink_dotfiles_home("X11/.Xmodmap", ".Xmodmap")
# mouse config:
softlink_dotfiles_home("X11/.imwheelrc", ".imwheelrc")

# xfce4
display_header("xfce4")
mkdir_p_from_home(".config/xfce4/terminal")
softlink_dotfiles_home("xfce4/terminalrc", ".config/xfce4/terminal/terminalrc")

# zsh
display_header("zsh")
mkdir_p_from_home(".oh-my-zsh/themes")
softlink_dotfiles_home("zsh/.zshrc", ".zshrc")
softlink_dotfiles_home("zsh/af-magic-light.zsh-theme", ".oh-my-zsh/themes/af-magic-light.zsh-theme")
