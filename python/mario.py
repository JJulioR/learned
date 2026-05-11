from cs50 import get_int

height = 0

while height < 1 or height > 8:
    height = get_int("Height: ")

for row in range(height):
    print(" " * (height - row - 1) + "#" * (row + 1) + "  " + "#" * (row + 1))
