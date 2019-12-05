#JSON file stores data as text in human-readable format. 
#Json stands for JavaScript Object Notation. R can read JSON files using the rjson package.

#The JSON file is read by R using the function from JSON(). It is stored as a list in R.
jsonreader <- function(){
# Load the package required to read JSON files.
library("rjson")
# Give the input file name to the function.
result <- fromJSON(file = "input.json")
# Print the result.
print(result)

# We can convert the extracted data above to a R data frame for 
# further analysis using the as.data.frame() function.
# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)
print(json_data_frame)

}

jsonreader()




















