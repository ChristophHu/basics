# python basics

# -------------------------
# <<< terminal commads >>>
# touch pythonfile.py
# code pythonfile.py

# -------------------------
# concatenation
hello = "hello"
world = "world"
hello_world = hello + " " + world

# string multiplication
three_hello = hello * 3

# string index / negativ index
ho = hello[0] + world[1]
print(ho)

do = world[-1] + hello[-1]
print(do)

# string slicing
monty_python = "Monty Python"
python = monty_python[6:]
monty = monty_python[:5]
py = monty_python[6:8]
print(monty + " " + python)

# in string
ice_cream = "ice cream"
contains = "ice" in ice_cream
print(ice_cream)

# string lenght
lenght = len(ice_cream)

# string methodes
print(monty_python.upper())
print(monty_python.lower())

# variable in string
print("I'm %d years old!" % 12)