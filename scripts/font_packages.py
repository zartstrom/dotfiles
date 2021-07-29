from collections import defaultdict
import re
from subprocess import check_output, CalledProcessError


def main():
    fc_list_output = check_output("fc-list", shell=True).decode()

    lines = fc_list_output.strip().split("\n")
    font_files = [line.split(":")[0] for line in lines]

    result = defaultdict(list)

    for font_file in font_files:
        escaped = re.sub(" ", "\ ", font_file)
        cmd = f"pacman -F {escaped}"
        try:
            res = check_output(cmd, shell=True).decode().strip()
        except CalledProcessError as exc:
            print(exc)
            continue

        package = res.split("is owned by ")[-1]

        result[package].append(font_file)

    for k, vs in result.items():
        print(k)
        for v in vs:
            print(f"  {v}")
            print()


if __name__ == "__main__":
    main()
