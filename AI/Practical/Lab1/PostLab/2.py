x=list(map(int,input().split()))
r=x[0]
c=x[1]

mi=list()

for i in range(r):
    a=list(map(int,input().split()))
    mi.append(min(a))

print("Max=",max(mi))