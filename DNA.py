#!/usr/bin/env python

string = input("Enter DNA string: ")
nA = 0
nC = 0
nG = 0
nT = 0

for nt in string:
    if nt == 'A':
        nA+=1
    elif nt == 'C':
        nC+=1
    elif nt == 'G':
        nG+=1
    elif nt == 'T':
        nT+=1
    else:
        print("what the heck!")
        continue

print(nA, nC, nG, nT)
