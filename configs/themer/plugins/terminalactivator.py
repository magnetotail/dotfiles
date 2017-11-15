from themer import ThemeActivator
import glob

colormapping = {'black': 0, 'red': 1, 'green': 2,
                'yellow': 3, 'blue': 4, 'magenta': 5,
                'cyan': 6, 'white': 7, 'alt_black': 8,
                'alt_red': 9, 'alt_green': 10, 'alt_yellow': 11,
                'alt_blue': 12, 'alt_magenta': 13, 'alt_cyan': 14,
                'alt_white': 15}
# Special colors.
# Source: https://goo.gl/KcoQgP
# 10 = foreground, 11 = background, 12 = cursor foregound
#  13 = mouse foreground


class TerminalActivator(ThemeActivator):
    def activate(self):
        sequences = []
        for color in self.colors:
            if color in colormapping:
                sequences.append(create_sequence(color, self.colors[color]))
        sequences.append(create_special_sequence(10, self.colors['white']))
        sequences.append(create_special_sequence(11, self.colors['black'], self.colors['transparency']))
        sequences.append(create_special_sequence(12, self.colors['white']))
        tty_pattern = "/dev/pts/[0-9]*"

        for term in glob.glob(tty_pattern):
            write_sequence(sequences, term)


def write_sequence(data, term):
    try:
        with open(term, "w") as file:
            for sequence in data:
                file.write(sequence)
    except PermissionError:
        print("Warning: Couldn't write to %s." % term)


def create_sequence(color_key, color):
    return "\033]4;%s;%s\007" % (colormapping[color_key], color)


def create_special_sequence(index, color, alpha=100):
    if index == 11 and alpha != 100:
        return "\033]%s;[%s]%s\007" % (index, alpha, color)
    return "\033]%s;%s\007" % (index, color)
