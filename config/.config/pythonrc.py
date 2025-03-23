import os
import sys
import re
from time import time
import json
import csv
from pathlib import Path
from pprint import pprint as pp
import itertools as it

# reloads modules
from importlib import reload

try:
    import rlcompleter
    import readline
    readline.parse_and_bind("tab: complete")
except ImportError:
    print('import error')

class Timer:
    """
    with Timer():
        do_something()
    """

    def __enter__(self):
        self.start = time()
        return self

    def __exit__(self, *args):
        print(f"Elapsed time: {time() - self.start:.4f} sec")
