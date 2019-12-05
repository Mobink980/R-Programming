directoryfunc <- function() {
print(getwd()) # Get and print current working directory.
}

#The csv file is a text file in which the values in the columns are separated by a comma
csvreader <- function(){
#read.csv() function is used to read a CSV file available in your current working directory
data <- read.csv("input.csv")
print(data)
#By default the read.csv() function gives the output as a data frame
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
}
csvreader()

getmax <- function(){
# Create a data frame.
data <- read.csv("input.csv")
# Get the max salary from data frame.
sal <- max(data$salary)
print(sal)
# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)
}
getmax()

#getting all the people in a department
department <- function(depart){
# Create a data frame.
data <- read.csv("input.csv")

retval <- subset( data, dept == depart)
print(retval)
}
department("IT")

#getting all the people in a department whom their salary is above a certain amount
departandsalary <- function(depart,sal){
# Create a data frame.
data <- read.csv("input.csv")

info <- subset(data, salary > sal & dept == depart)
print(info)
}
departandsalary("IT",600)

#Get the people who joined on or after a certain date
datefinder <- function(date){
# Create a data frame.
data <- read.csv("input.csv")

retval <- subset(data, as.Date(start_date) > as.Date(date))
print(retval)
}
datefinder("2014-01-01")


#The csv file is a text file in which the values in the columns are separated by a comma
csvwriter <- function(){
# Create a data frame.
data <- read.csv("input.csv")
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))

# Write filtered data into a new file. when we false row.names, the numbers of rows picked will disapear
write.csv(retval,"output.csv", row.names = FALSE) 
newdata <- read.csv("output.csv")
print(newdata)
}
csvwriter()














