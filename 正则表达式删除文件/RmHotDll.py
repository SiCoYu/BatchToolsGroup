#search.py
# import os
# import sys

# def search(path, word):
    # for filename in os.listdir(path):
        # fp = os.path.join(path, filename)
        # if os.path.isfile(fp):
            
        # elif os.path.isdir(fp):
            # search(fp, word)

# search(sys.argv[1], sys.argv[2])

import os
import re
from glob import *

def matchWildcard(rootPath = "", pattern = ""):
    rootPath = os.path.abspath(rootPath)
    results = []
    for root,dirs,files in os.walk(rootPath):
        for match in glob(os.path.join(root, pattern)):
            results.append(match)
    if len(results) > 0 :
        print results
        for tempfile in results:
            os.remove(tempfile)
def main():
    dirs = ["Binaries","Plugins"]
    suffixs = ["*patch_[0-9].dll","*patch_[0-9].lib","*patch_[0-9].pdb","*patch_[0-9].exe","*patch_[0-9].exp"]
    for tempdir in dirs:
        for tempfile in suffixs:
            matchWildcard(tempdir, tempfile)
if __name__ == "__main__":
    main()