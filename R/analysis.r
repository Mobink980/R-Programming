
if(FALSE){
"Time series is a series of data points in which each data point is associated with a timestamp. 
A simple example is the price of a stock in the stock market at different points of time on a given day. 
Another example is the amount of rainfall in a region at different months of the year. 
R language uses many functions to create, manipulate and plot the time series data. 
The data for the time series is stored in an R object called time-series object. 
It is also a R data object like a vector or data frame."

#The time series object is created by using the ts() function
#timeseries.object.name <-  ts(data, start, end, frequency)
"data is a vector or matrix containing the values used in the time series.
start specifies the start time for the first observation in time series.
end specifies the end time for the last observation in time series.
frequency specifies the number of observations per unit time."

}
function1 <- function(){
#We create an R time series object for a period of 12 months and plot it.
# Get the data points in form of a R vector.
rainfall <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)

# Convert it to a time series object.
rainfall.timeseries <- ts(rainfall,start = c(2012,1),frequency = 12)

# Print the timeseries data.
print(rainfall.timeseries)

# Give the chart file a name.
png(file = "rainfall.png")

# Plot a graph of the time series.
plot(rainfall.timeseries)

# Save the file.
dev.off()
}
# function1()

if(FALSE){
"The value of the frequency parameter in the ts() function decides the time intervals
at which the data points are measured"
"frequency = 12 pegs the data points for every month of a year.
frequency = 4 pegs the data points for every quarter of a year.
frequency = 6 pegs the data points for every 10 minutes of an hour.
frequency = 24*6 pegs the data points for every 10 minutes of a day."
}

function2 <- function(){
# Get the data points in form of a R vector.
rainfall1 <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
rainfall2 <- 
           c(655,1306.9,1323.4,1172.2,562.2,824,822.4,1265.5,799.6,1105.6,1106.7,1337.8)

# Convert them to a matrix.
combined.rainfall <-  matrix(c(rainfall1,rainfall2),nrow = 12)

# Convert it to a time series object.
rainfall.timeseries <- ts(combined.rainfall,start = c(2012,1),frequency = 12)

# Print the timeseries data.
print(rainfall.timeseries)

# Give the chart file a name.
png(file = "rainfall_combined.png")

# Plot a graph of the time series.
plot(rainfall.timeseries, main = "Multiple Time Series")

# Save the file.
dev.off()
}
function2()








































































