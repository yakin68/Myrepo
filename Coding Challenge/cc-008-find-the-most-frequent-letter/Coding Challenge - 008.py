# -*- coding: utf-8 -*-
"""Untitled17.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/15lvUQyE6yyLG2vXPCqpnDx90DgeUwWRk
"""

harf=""
max_number=0
liste=[]
while True:
  a=input("Enter a string:").lower()
  b=set(a)
  if a=="exit":
    break
  else:
    for i in b:
      liste.append(i)
for i in liste:
  c=liste.count(i)
  if c > max_number:
    max_number=c
    d=harf+i
print(f"{d}--->{max_number}")