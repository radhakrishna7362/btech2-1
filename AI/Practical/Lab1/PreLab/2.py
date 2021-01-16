def func(x):
    switcher = {
        1: str.upper(),
        2: str.lower(),
        3: str.isupper(),
        4: str.islower(),
        5: str.replace('INTELLIgence','Neural Network'),
        6: str.startswith('T'),
        7: str.endswith('e'),
        8: str.capitalize(),
        9: str.swapcase()
    }
    return switcher.get(x,"Invalid Number")

str=input("Enter a string: ")

while True:
    print("1.Convert the input string into UpperCase")
    print("2.Convert the input string into LowerCase")
    print("3.Check whether all the character of the input string are in UpperCase")
    print("4.Check whether all the character of the input string are in LowerCase")
    print("5.Replace string 'INTELLIgence' by 'Neural Network'")
    print("6.Check whther the given string starts with 'T'")
    print("7.Check whether the given string ends with 'e'")
    print("8.Convert the first letter of the input string into caital letter")
    print("9.Convert the LowerCase characters to UpperCase and ViceVersa")
    print("10.Exit")
    print("-------------------")
    x=int(input("Choose any Option: "))
    if(x==10):
        break
    print (func(x))
    
    