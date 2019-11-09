#!/usr/bin/python3


from subprocess import run


PACKAGES = [
    "alacritty",
    "ansible",
    "ansible-lint",
    "firefox",
    "git",
    "inkdrop",
    "python-pylint",
    "sbt",
    "scala",
    "scala-dotty",
    # "scalafmt-native",
    "termite",
    "termite-terminfo",
    "zsh",
    "zsh-autosuggestions",
    "zsh-history-substring-search",
    "zsh-syntax-highlighting",
]

def main():
    command = "yay --noconfirm -S %s" % " ".join(PACKAGES)
    print(command)
    run(command, shell=True)


if __name__ == "__main__":
    main()
