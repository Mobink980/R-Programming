
a <- "Hello"
b <- 'How'
c <- "are you? "
#paste function is for combining the strings
#sep is the seperator between arguments
#collapse is used to eliminate the space between two strings but not in one string
printfunc <- function(){
print(paste(a,b,c))
print(paste(a,b,c, sep = "-"))
print(paste(a,b,c, sep = ""))
print(paste(a,b,c, sep = "", collapse = ""))
}
#printfunc()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#format function is used to format numbers and trings to a specific style
formatfunc <- function(){
    # Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)

# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)

 print(nchar(a)) #nchar function counts the number of characters 
}

# formatfunc()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
casefunc <- function(){
    up <- "THIS IS UPPERCASE.Yes!"
    down <- "This is LoweCase YEP"
    print(tolower(up))
    print(toupper(down))
}

# casefunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#extracting parts of a String (R starts from 1 not 0)
subfunc <- function(){
string <- "miscomputation";
str <- substring(string, 4, 9)
print(paste(str,"er", sep = ""))
}
# subfunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#vector creation
vectorfunc <- function(){
# Atomic vector of type character.
print("abc");
# Atomic vector of type double.
print(12.5)
# Atomic vector of type integer.
print(63L)
# Atomic vector of type logical.
print(TRUE)
# Atomic vector of type complex.
print(2+3i)
# Atomic vector of type raw.
print(charToRaw('hello'))

#vectors with multiple elements
#by colon
# Creating a sequence from 5 to 13.
v <- 5:13
print(v)
# Creating a sequence from 6.6 to 12.6.
v <- 6.6:12.6
print(v)
# If the final element specified does not belong to the sequence then it is discarded.
v <- 3.8:11.4
print(v)

#using sequence operator
# Create vector with elements from 5 to 9 incrementing by 0.4.
print(seq(5, 9, by = 0.4))

#using c function
# The logical and numeric values are converted to characters.
s <- c('apple','red',5,TRUE)
print(s)

#Accessing vector elements
# Accessing vector elements using position.
t <- c("Sun","Mon","Tue","Wed","Thurs","Fri","Sat")
u <- t[c(2,3,6)]
print(u)

# Accessing vector elements using logical indexing.
v <- t[c(TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE)]
print(v)

# Accessing vector elements using negative indexing.
x <- t[c(-2,-5)] #printing all elements except the mentioned ones
print(x)

# Accessing vector elements using 0/1 indexing.
y <- t[c(0,0,0,0,0,0,1)]
print(y)

v1 <- c(3,8,4,5,0,11) #vectors with different lengths
v2 <- c(4,11) #the elements of the shorter vector are recycled to complete the operations
# V2 becomes c(4,11,4,11,4,11)

add.result <- v1+v2
print(add.result)

sub.result <- v1-v2
print(sub.result)

#sorting
v1 <- c(3,8,4,5,0,11, -9, 304)
v2 <- c("Red","Blue","yellow","violet")
# Sort the elements of the vector.
print(sort(v1))
# Sort the elements in the reverse order.
print(sort(v1, decreasing = TRUE))

# Sorting character vectors.
# Sort the elements of the vector.
print(sort(v2))
# Sort the elements in the reverse order.
print(sort(v2, decreasing = TRUE))
}

# vectorfunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
listfunc <- function(){
# Create a list containing strings, numbers, vectors and a logical value
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)

#The list elements can be given names and they can be accessed using these names.
# Create a list containing a vector, a matrix and a list.
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),
   list("green",12.3))

# Give names to the elements in the list.
names(list_data) <- c("1st Quarter", "A_Matrix", "An Inner list")
# Show the list.
print(list_data)

#Accessing List Elements
# Access the first element of the list.
print(list_data[1])

# Access the thrid element. As it is also a list, all its elements will be printed.
print(list_data[3])

# Access the list element using the name of the element.
print(list_data$A_Matrix)

#List Manipulation (in the list, [[1]] means the first element of that element of the list)
#if we have a list in a list, then we can have [[2]], otherwise we only have [[1]]
# Add element at the end of the list.
list_data[4] <- "New element"
print(list_data[4])

# Remove the last element.
list_data[4] <- NULL

# Print the 4th Element.
print(list_data[4])

# Update the 3rd Element.
list_data[3] <- "updated element"
print(list_data[3])

#merging two lists
# Create two lists.
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")

# Merge the two lists.
merged.list <- c(list1,list2)

# Print the merged list.
print(merged.list)

#converting lists to vectors
# Create lists.
list1 <- list(1:5)
print(list1)

list2 <-list(10:14)
print(list2)
#we convert lists to vectors and add them together
vec1 <- unlist(list1)
vec2 <- unlist(list2)
result = vec1 + vec2
print(result)
}

# listfunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#matrix(data, nrow, ncol, byrow, dimnames)
#data is the input vector which becomes the data elements of the matrix.
# nrow is the number of rows
# ncol is the number of columns
# byrow is a logical clue. If TRUE then the input vector elements are arranged by row.
# dimname is the names assigned to the rows and columns.

matrixfunc <- function(){
# Elements are arranged sequentially by row.
M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)

# Define the column and row names.
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
print(P)

#Accessing the elements of the matrix
# Access the element at 3rd column and 1st row.
print(P[1,3])

# Access the element at 2nd column and 4th row.
print(P[4,2])

# Access only the  2nd row.
print(P[2,])

# Access only the 3rd column.
print(P[,3])

#Matrix calculatios
cat("Result of addition","\n")
print(M+N)
cat("Result of subtraction","\n")
print(M-N)
cat("Result of multiplication","\n")
print(M*N)
cat("Result of division","\n")
print(M/N)
}

# matrixfunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arrayfunc <- function(){
#The following example creates an array of two 3x3 matrices each with 3 rows and 3 columns.
# Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))#takes one column and fills the rows
print(result)

column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

# Take these vectors as input to the array.(with names)
result <- array(c(vector1,vector2),dim = c(3,3,2),dimnames = list(row.names,column.names,
   matrix.names))
print(result)

#Accessing array elements
# Print the third row of the second matrix of the array.
print(result[3,,2])

# Print the element in the 1st row and 3rd column of the 1st matrix.
print(result[1,3,1])

# Print the 2nd Matrix.
print(result[,,2])
}

arrayfunc2 <- function(){
    # Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
array1 <- array(c(vector1,vector2),dim = c(3,3,2))

# Create two vectors of different lengths.
vector3 <- c(9,1,0)
vector4 <- c(6,0,11,3,14,1,2,6,9)
array2 <- array(c(vector1,vector2),dim = c(3,3,2))

# create matrices from these arrays.
matrix1 <- array1[,,2]
matrix2 <- array2[,,2]

# Add the matrices.
result <- matrix1+matrix2
print(matrix1)
print(matrix2)
print(result)

#We can do calculations across the elements in an array using the apply() function
v1 <- c(2,3,4,6)
v2 <- c(2,4,6,9,8)
new.array <- array(c(v1,v2),dim=c(3,3,2))
print(new.array)
# Use apply to calculate the sum of the rows across all the matrices.
result <- apply(new.array, c(1), sum)
print(result)
}
# arrayfunc()
# arrayfunc2()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#factors are useful in columns with a limited number of uniqe values such as Female and Male
#used for statistical modelling
factorfunc <- function(){
# Create a vector as input.
data <- c("East","West","East","North","North","East","West","West","West","East","North")

print(data)
print(is.factor(data))

# Apply the factor function.
factor_data <- factor(data)

print(factor_data)
print(is.factor(factor_data))

# Apply the factor function with required order of the level.(changing the order of the levels)
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)


# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame.
input_data <- data.frame(height,weight,gender)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data$gender))

# Print the gender column to see the levels.
print(input_data$gender)

# We can generate factor levels by using the gl() function.
# first element is the number of levels
# second is the number of replications
# third is the labels for each level
v <- gl(3, 4, labels = c("Tampa", "Seattle","Boston"))
print(v)
}
# factorfunc()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataframefunc = function(){
# Create the data frame.
emp.data <- data.frame(
   emp_id = c (1:5), 
   emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
   salary = c(623.3,515.2,611.0,729.0,843.25), 
   
   start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
      "2015-03-27")),
   stringsAsFactors = FALSE
)
# Print the data frame.			
print(emp.data) 
# Get the structure of the data frame.
str(emp.data)
# Print the summary.(summary of data in dataframe)
print(summary(emp.data))
# Extract Specific columns.(extracting data from dataframe)
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)
# Extract first two rows.
result <- emp.data[1:2,]
print(result)
# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

#expanding data frames
#adding columns
# Add the "dept" coulmn.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)

#Adding rows (merging two dataframes)
# Create the second data frame
emp.newdata <- 	data.frame(
   emp_id = c (6:9), 
   emp_name = c("Rasmi","Pranab","Tusar","Ali"),
   salary = c(578.0,722.5,632.8,800.90), 
   start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17","2014-06-10")),
   dept = c("IT","Operations","Fianance","Data Mining"),
   stringsAsFactors = FALSE
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)
}

dataframefunc()








