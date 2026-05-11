from cs50 import get_int

number = get_int("Number: ")

digits = str(number)
length = len(digits)

total = 0

# Algorith Luhn
for i in range(length - 1, -1, -1):
    digit = int(digits[i])

    if (length - i) % 2 == 0:
        digit *= 2
        if digit > 9:
            digit = digit - 9

    total += digit

# type de carte
if total % 10 != 0:
    print("INVALID")
elif length == 15 and (digits.startswith("34") or digits.startswith("37")):
    print("AMEX")
elif length == 16 and digits.startswith(("51","52","53","54","55")):
    print("MASTERCARD")
elif (length == 13 or length == 16) and digits.startswith("4"):
    print("VISA")
else:
    print("INVALID")
 
