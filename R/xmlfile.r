#XML is a file format which shares both the file format and the data on the World Wide Web,
#intranets, and elsewhere using standard ASCII text. It stands for Extensible Markup Language (XML).
#Similar to HTML it contains markup tags. But unlike HTML where the markup tag describes structure of the page,
# in xml the markup tags describe the meaning of the data contained into the file.


#The xml file is read by R using the function xmlParse(). It is stored as a list in R.
# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

# Print the result.
print(result)

# Print the number of nodes.
print(rootsize)

# Print the first record of the parsed file
print(rootnode[1])

# Get the first element of the first node.
print(rootnode[[1]][[1]])

# Get the fifth element of the first node.
print(rootnode[[1]][[5]])

# Get the second element of the third node.
print(rootnode[[3]][[2]])

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)











































