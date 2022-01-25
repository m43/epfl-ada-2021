# rsync -azvhP rajic@izar:/home/rajic/xode/ada/ ~/Desktop/ada --dry-run
import os

logs_folder = "."
for filename in next(os.walk(logs_folder), (None, None, []))[2]:
    if filename.endswith(".log"):
        with open(filename, "r") as f:
            print(filename)
            print(f.read())
            print()
