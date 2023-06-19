print("###  This program converts milliseconds into hours, minutes, and seconds ###")

while True:
    a = input("Enter a number to convert, or type 'exit' to end the program: ")

    if a == "exit" or a == "EXIT":
        print("Exiting the program... Good Bye")
        break

    if not a.isnumeric() or int(a) < 1:
        print("Enter a positive numeric value greater than 1.")
    else:
        a = int(a)

        if 1000 < a < 10000:
            b = a // 1000
            print(f"{a} is {b} second")
            break
        elif 60000 < a < 3600000:
            c = a // 60000
            d = a % 60000
            e = d // 1000
            print(f"{a} is {c} minutes and {e} second")
            break
        else:
            f = a // 3600000
            g = a % 3600000
            x = g // 60000
            y = g % 60000
            z = y // 1000
            print(f"{a} is {f} hours {x} minutes and {z} second")
            break
