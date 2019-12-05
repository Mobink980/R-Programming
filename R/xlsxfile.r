# Verify the package is installed.
any(grepl("xlsx",installed.packages()))

# Load the library into R workspace.
library("xlsx")

#The input.xlsx is read by using the read.xlsx() function
xlsxreader <- function(){
# Read the first worksheet in the file input.xlsx.
data <- read.xlsx("sheet.xlsx", sheetIndex = 1)
print(data)
}
xlsxreader()


xlsxwriter <- function(){
# Create a data frame.
data1 <- read.xlsx("sheet.xlsx", sheetIndex = 1)
data2 <- read.xlsx("city.xlsx", sheetIndex = 1)

# Write filtered data into a new file. when we false row.names, the numbers of rows picked will disapear
write.xlsx(data1,"output.xlsx", row.names = FALSE) 
newdata <- read.xlsx("output.xlsx",sheetIndex = 1)
print(newdata)
}
xlsxwriter()


















