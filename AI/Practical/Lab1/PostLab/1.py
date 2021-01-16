from datetime import date

today=date.today()

print("Hello I am Chatty Here to help You")
print("May I know your good name?")
str=input()
print("Hello",str)
choice=input("Do you want to know your age in years,days,hours,minutes,sec you live till now?")
if(choice.lower()=="yes" or choice.lower() =="y"):        
    day=int(input("Date: "))
    month=int(input("Month: "))
    year=int(input("Year: "))
    dob=date(year,month,day)
    now=date.today()
    if(today.month<dob.month):
        print(today.year-dob.year-1,"years")
    elif(today.month==dob.month and today.day<dob.day):
        print(today.year-dob.year-1,"years")
    else:
        print(today.year-dob.year,"years")
    diff=now-dob
    print(diff.days,"days")
    print(diff.days*24,"hours")
    print(diff.days*24*60,"minutes")
    print(diff.days*24*60*60,"seconds")
    color=input("Can I know your favourite Color")
    if(color.upper()=="BLUE"):
        print("Blue is the color of sea and sky. It is often associated with depth and stability")
    if(color.upper()=="RED"):
        print("Red is the color of blood")
    if(color.upper()=="GREEN"):
        print("Green is the color of nature")
    if(color.upper()=="PINK"):
        print("Pink, a delicate color that means sweet,charming")
    print("It's time to say bye")
    print("I hope you enjoy well")
else:
    print("Byee")