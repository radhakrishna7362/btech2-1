print("Hi I am student advisor chat Bot.\nMay I know your name?")
str=input();
print("Thank You", str);
print("I am here to explore you about the core courses required for the specialization's offered in KL University. Cse Dept")
dic1={"Global certication":"Professional Scrum Master","Core Course in 1st Sem":"Software Engneering"}
dic2={"Global certication":"None","Core Course in 1st Sem":"None"}
dic3={"Global certication":"Linux Essential(010-160)","Core Course in 1st Sem":"Operating Systems"}
dic4={"Global certication":"Unity Developer Advance Certification","Core Course in 1st Sem":"Enterprise Programming"}
dic5={"Global certication":"ETHEREUM Developer Advance Certification","Core Course in 1st Sem":"Computer Networks"}
dic6={"Global certication":"PCAP|CertifiedAssociatePythonProgramming","Core Course in 1st Sem":"AI & Mathematical Programming"}
dic7={"Global certication":"C100DEV:MangoDB certified DeveloperAssociate","Core Course in 1st Sem":"Data Base Managements System"}
dic8={"Global certication":"None","Core Course in 1st Sem":"None"}

def func(x):
    switcher = {
        1: dict1,
        2: dict2,
        3: dict3,
        4: dict4,
        5: dict5,
        6: dict6,
        7: dict7,
        8: dict8
    }
    return switcher.get(x,False);

while(True):
    print("1. Software Modelling & DevOps\n2. Internet of Things\n3.Cloud & Edge Computing\n4. Graphics, Gaming &UX Design")
    print("5. Cyber Security & Blockchain Technology\n6.Artificial Intelligence & Intelligence Process Automation")
    print("7. Data Science & Big Data Analytics\n8. Computer Communications\n9.Exit\n");
    x=int(input("These are the specialization's offered by KL CSE.Choose any specialization."
                 ,"(select any option)\n Choose any option: "));
    if(func(x)==False):
        break;
    else:
        print(func(x));