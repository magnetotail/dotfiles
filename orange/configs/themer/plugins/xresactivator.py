from themer import ThemeActivator
import os
import subprocess

class XresActivator(ThemeActivator):
    def activate(self):
        subprocess.Popen(["xrdb", "-merge", "/home/selphie/.Xdefaults"])
