from themer import ThemeActivator
import os
import subprocess
import time

class UIRestarter(ThemeActivator):
    def activate(self):
        subprocess.Popen("/home/selphie/.config/scripts/uirestart.sh")

