#running R files: Rscript -e "source('E:/programs/R/first.r')" 
#in the paranthese is the path to the file and must be run in cmd or powershell
#or simply go to the direction of the file and print: rscript first.r
#to switch to r command prompt, print rterm
myString <- "Hello, World!"
print ( myString)

# r does not support multiline comments but here's a trick
if(FALSE){
    "unlike c or java programming, in r variables are not determined by their datatype
    but instead, The variables are assigned with R-Objects and the data type of the R-object
    becomes the data type of the variable. There are many types of R-objects. 
    The frequently used ones are:"
    '==> Vectors
     ==> Lists
     ==> Matrices
     ==> Arrays
     ==> Factors
     ==> Data Frames'

     "data types of these objects can be, Logical,Numeric,Integer,Complex,Character,Raw"
}
v1 <- TRUE  #FALSE and TRUE should all be in capitals to work, not True or false
v2 <- 23.5
v3 <- 2L
v4 <- 2+5i
v5 <- "true"
v6 <- charToRaw("Hello")
print(paste0(class(v1)," ",class(v2)," ",class(v3)," ",class(v4)," ",class(v5)," ",class(v6)))
cat("The number is :",v2) #it does the job of paste and also prints
print("  ")

#when creating vectors with more than one element, we use c() to combine elements into a vector
# Create a vector.
apple <- c('red','green',"yellow")
print(apple)

# Get the class of the vector.
print(class(apple))

#A list is an R-object which can contain many different types of elements inside it   
#like vectors, functions and even another list inside it.
# Create a list.
list1 <- list(c(2,5,3),21.3,sin)

# Print the list.
print(list1)

# Create a matrix.(It can be created using a vector input to the matrix function.)
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

#Matrices are only in two dimensions while arrays can be in many dimensions
#The array function takes a dim attribute which creates the required number of dimension.
# Create an array.(an array with 2 elements that each element is a 3*3 matrix)
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)


# a factor stores the vector with the distinct values that it contains as labels.
#the labels are characters, irrespective of what they are in the vector(numeric,logical,etc)
#Factors are useful in statistical modelling.
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple)) #nlevels function gives the count of levels.

#Data frames are lists of vectors of equal length
#Unlike a matrix in data frame each column can contain different modes of data.
#Data Frames are created using the data.frame() function.
# Create the data frame.
BMI <- 	data.frame(
   gender = c("Male", "Male","Female"), 
   height = c(152, 171.5, 165), 
   weight = c(81,93, 78),
   Age = c(42,38,26)
)
print(BMI)

#variable assignment
# Assignment using equal operator.(dot is accepted in naming variables)
var.1 = c(0,1,2,3)           

# Assignment using leftward operator.
var.2 <- c("learn","R")   

# Assignment using rightward operator.   
c(TRUE,1) -> var.3  #logical class is coerced to numeric class making TRUE as 1         
c(TRUE,1,"hello") ->> var.4
print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")
cat ("class of var.3 is ", class(var.3) ,"class of var.4 is",typeof(var.4),"\n")

#To know all the variables currently available in the workspace we use the ls() function.
print(ls()) #print(ls(all.name = TRUE)) is to show variables starting with dot with others

rm(var.3) #deleting variable var.3
# print(var.3) #deleting all the variables by: rm(list=ls())

v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v+t) #Arithmetic operations on vectors
print(v-t) 
print(v*t)
print(v/t)
print(v%%t) #remainder of the first vector with the second
print(v%/%t) #quotient 
print(v^t) #exponentiation

print(v>=t) #Relational operations
print(v!=t)

#Assignment can be done by = , -> , ->>

logic1 = c(TRUE,FALSE,TRUE) #Logical operations
logic2 = c(FALSE,TRUE,TRUE)
print(logic1 & logic2) #elementwise logical and
print(logic1 | logic2) #elementwise logical or
print(!logic2) #logical not operator
print(logic1 && logic2) #logical and operator (only checks the first element)
print(logic1 || logic2) #logical or operator (only checks the first element)

series1 <- 2:6 # : operator is for holding the sequence of numbers
new1 <- 12
series2 <- 1:10 #%n% is for checking if an element belongs to a vector.
print(new1 %in% series2)

M1 = matrix(c(1,0,0,1), nrow=2, ncol=2, byrow=TRUE) #the identity matrix
M2 = matrix(c(2,3,4,5), nrow=2, ncol=2, byrow=TRUE)
t = M1 %*% M2 # %*% is used for matrix multiplication
print(t)

M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
t = M %*% t(M) # t(M) is the transpose of the matrix M
print(t)



