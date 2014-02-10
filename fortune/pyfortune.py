#!/usr/bin/python

import random
import sys

if len(sys.argv) < 2:
    print "usage: python pyfortune.py <File1> .... <FileN>"
    exit()


random.seed()

fortune_files = sys.argv[1:]

possible_fortunes = []

for fortune_file in fortune_files:
    with open(fortune_file, 'r') as file:
        possible_fortunes.extend([quote.replace(r'\n','').strip() for quote in file.readlines() if "%" not in quote])
    
random.shuffle(possible_fortunes);

print possible_fortunes[random.randint(0,len(possible_fortunes)-1)]
