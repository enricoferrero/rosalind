#!/usr/bin/env python

string = input("Enter DNA string: ")
newString = ""

for nt in string:
	if nt == 'T':
		newString+='U'
	else:
		newString+=nt

print(newString)
