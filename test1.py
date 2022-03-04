import os.path
import traceback
from os.path import exists


def file_create(file1):
    try:
        if not os.path.exists(file1):
            f = open(file1, "w")

            f.write("Colertokens")
            f.close()

        f1 = open(file1, 'r+')
        data = f1.read()
        print(data)
        f1.close()

        if not os.path.exists("file2.txt"):
            f1 = open("file2.txt", 'w')
            f1.write(str(data))
            f1.close()
    except Exception:
        print("exception")
        print(traceback.print_exc())


file_create("file1.txt")
