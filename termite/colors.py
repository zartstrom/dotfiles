import re
from subprocess import call


class RGB(object):
    def __init__(self, rgb_string, text=None):
        self.rgb_string = rgb_string
        self.text = text if text else rgb_string
        self.rgb = rgb_string.strip('#')
        self.red = self.base_10(self.rgb[0:2])
        self.green = self.base_10(self.rgb[2:4])
        self.blue = self.base_10(self.rgb[4:6])

    @staticmethod
    def base_10(base_16_str):
        return int(base_16_str, 16)

    def show(self):
        cmd = 'printf "\x1b[38;2;{red};{green};{blue}m{text}\x1b[0m\n"'.format(
            red=self.red,
            green=self.green,
            blue=self.blue,
            text=self.text
        )
        call(cmd, shell=True, executable="/bin/bash")
        # return cmd


def main():
    rgbs = []

    # input_file = "/home/phil/.config/termite/color/flat"
    input_file = "/home/phil/.config/termite/color/flat"

    with open(input_file, "r") as infile:
        for line in infile:
            line = line.strip()
            m = re.search(r"#[a-fA-F0-9]{6}", line)
            if m:
                rgbs.append(RGB(m.group(0), line))

    for x in rgbs:
        x.show()



if __name__ == "__main__":
    main()
