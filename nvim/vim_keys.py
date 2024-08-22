import pynvim

KEYS_FILE = "vim_keys.txt"


def write_keys_file(nvim, filepath=KEYS_FILE):
    cmd_redir = f"redir! > {filepath}"
    cmd_redir_off = "redir END"
    nvim.command(cmd_redir)
    nvim.command("silent verbose map")
    nvim.command(cmd_redir_off)


def main():
    nvim = pynvim.attach(
        "child",
        argv=["/usr/bin/env", "nvim", "--embed", "--headless"],
    )

    # Some plugins are loaded lazily. Open a file to load treesitter command for example.
    nvim.command("e ~/dotfiles/set_softlinks.py")
    write_keys_file(nvim)

    nvim.close()


if __name__ == "__main__":
    main()
