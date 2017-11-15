from themer import ThemeActivator
import os
import subprocess
import time

class PolyActivator(ThemeActivator):
    def activate(self):
        subprocess.Popen(["killall", "polybar"])
        time.sleep(0.1)
        subprocess.Popen(["polybar", "main"])

