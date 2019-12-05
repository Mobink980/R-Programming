# .libPaths() #this command gives the R library

func1 <- function(){
# Create vector objects.
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

# Combine above three vectors into one data frame.
addresses <- cbind(city,state,zipcode)

# Print a header.
cat("# # # # The First data frame\n") 

# Print the data frame.
print(addresses)

# Create another data frame with similar columns
new.address <- data.frame(
   city = c("Lowry","Charlotte"),
   state = c("CO","FL"),
   zipcode = c("80230","33949"),
   stringsAsFactors = FALSE
)

# Print a header.
cat("# # # The Second data frame\n") 

# Print the data frame.
print(new.address)

# Combine rows form both the data frames.
all.addresses <- rbind(addresses,new.address)

# Print a header.
cat("# # # The combined data frame\n") 

# Print the result.
print(all.addresses)

#We can merge two data frames by using the merge() function.
#The data frames must have same column names on which the merging happens.
library(MASS)
merged.Pima <- merge(x = Pima.te, y = Pima.tr,
   by.x = c("bp", "bmi"),
   by.y = c("bp", "bmi")
)
print(merged.Pima)
nrow(merged.Pima)
}
# func1()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# reshaping the data
func2 <- function(){
library(MASS)
print(ships)

library(reshape2)
#Now we melt the data to organize it, converting all columns other than type and year into multiple rows
molten.ships <- melt(ships, id = c("type","year"))
# print(molten.ships)

#Use ‘acast’ or ‘dcast’ depending on whether you want vector/matrix/array output or data frame output.
#We can cast the molten data into a new form where the aggregate of each type of ship for each year is created. 
#It is done using the cast() function.(for each id=(type,year) the aggregate of other columns is calculated)
recasted.ship <- dcast(molten.ships, type+year~variable,sum)
print(recasted.ship)
}
func2()





















