#Many websites provide data for consumption by its users like World Health Organization(WHO) 
#in the forms of csv, txt, and xml files and we can use them programatically

#We will use the function getHTMLLinks() to gather the URLs of the files.
#Then we will use the function download.file() to save the files to the local system
#As we will be applying the same code again and again for multiple files,
# we will create a function to be called multiple times
#The filenames are passed as parameters in form of a R list object to this function

# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
   filedetails <- str_c(mainurl,filename)
   download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")






























