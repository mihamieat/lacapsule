# Python Program to find largest of Two Numbers
# Python Program to compare two integers in both French and English

a = float(input("Please Enter the First value a : "))
b = float(input("Please Enter the Second Value b : "))

if(a>b):
   print("{0} is greater than {1}".format(a,b))
elif(b>a):
   print("{0} is greater than {1}".format(b,a))
else:
   print("Both a and b are Equal")
