import re

txt = "The rain in Spain"
x = re.search("^The.*Spain$", txt)

if x:
    print("match")
else:
    print("not match")



print(re.findall("The",txt))

import os

print(os.name)
print(os.error)

print(os.popen())

from subprocess import Popen ,PIPE

process = Popen(['file','file2','-d'],stdout=PIPE,stderr=PIPE)
stdout,stderr = process.communicate()