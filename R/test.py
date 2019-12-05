import numpy as np
# adds the numbers from 1 to x
def summation(x): 
    if(isinstance(x, int)): 
        return x*(x+1)/2   
    return "Invalid Value"


# return masked string
def maskify(cc):
    s = list(cc)
    for i in range(len(s)-4):
        s[i]="#"
    return "".join(s)

    #returns the sum of numbers between two integers
def get_sum(a,b):
    if(b>=a):p =list(range(a,b+1))     
    else: p = list(range(b,a+1)) 
    return sum(p)
#finds the missing letter in a list of consequtive letters 
def find_missing_letter(chars):
    for i in range(len(chars)-1):
        if ord(chars[i+1])!= ord(chars[i])+1:
            return chr(ord(chars[i])+1)
    return True
#returns the years for the population to supercede p
def nb_year(p0, percent, aug, p):
    count=0
    while(p0<p):
        p0 = p0+p0*(percent/100)+aug
        count += 1
    return count

#each level some people come and some leave, returns what remains at the end
def number(bus_stops):
    sum = 0
    for i in range(len(bus_stops)):
        sum += bus_stops[i][0]
    for j in range(len(bus_stops)):
        sum -= bus_stops[j][1]
    return sum
# find letters that are not between a and m and returns a ratio to the length of the string
def printer_error(s):
    l = list(s)
    count=0
    for i in range(len(l)):
        if (ord(l[i])<97 or ord(l[i])>109):
            count += 1
    return "{}/{}".format(count, len(l))
#deletes - and _ and makes camel-case words
def to_camel_case(text):
    s = list(text)
    for i in range(len(s)):
        if s[i]=="-" or s[i]=="_":
            s[i]=""
            s[i+1]=s[i+1].upper()
    return "".join(s)
#checks whether the braces are valid
def validBraces(string):
    s = [] #a list to use as stack
    l = list(string) #a list to hold characters
    if l[0]==")" or l[0]=="}" or l[0]=="]":
        return False
    for i in range(len(l)):
        if l[i]=="(" or l[i]=="{" or l[i]=="[":
            s.append(l[i])
        if l[i]==")":
            if s[len(s)-1]=="(":
                s.pop()
        if l[i]=="}":
            if s[len(s)-1]=="{":
                s.pop()
        if l[i]=="]":
            if s[len(s)-1]=="[":
                s.pop()
        if len(s)==0 and i+1!=len(l):#if the stack is empty and characters remaining
            if l[i+1]==")" or l[i+1]=="}" or l[i+1]=="]":
                return False 
    if len(s)==0:
        return True
    return False


def find_it(seq):
    list = []
    for i in range(len(seq)):
        if seq[i] in list:
            list.remove(seq[i])
        else:
            list.append(seq[i])
    return list[0]

def is_prime(num):   
    if num<2: return False #negative numbers,0,1 are not prime
    for i in range(2,int(np.sqrt(num)+1),1):
        if i!=num and num%i==0:
            return False
    return True

print(is_prime(2))
# print(find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]))
# print(validBraces("())({}}{()][]["))
# print(to_camel_case("The_Stealth_Warrior"))
# print(printer_error("aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"))
# print(number([[10,0],[3,5],[5,8]]))
# print(nb_year(1500000, 2.5, 10000, 2000000))
# print(find_missing_letter(['a','b','c','d','e']))
# print(get_sum(2,-3))
# print(maskify("13"))
# print(summation("12"))