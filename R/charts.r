#In R the pie chart is created using the pie() function which takes positive numbers as a vector input.
# the syntax of creating pie chart
#pie(x, labels, radius, main, col, clockwise)
if(FALSE){
    "x is a vector containing the numeric values used in the pie chart."
    "labels is used to give description to the slices."
    "radius indicates the radius of the circle of the pie chart.(value between −1 and +1)."
    "main indicates the title of the chart"
    "col indicates the color palette"
    "clockwise is a logical value indicating if the slices are drawn clockwise or anti clockwise."
}

pie_chart <- function(){
# Create data for the graph.
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")

piepercent<- round(100*x/sum(x), 1)

# Give the chart file a name.
png(file = "city_percentage_legends.jpg") #save the file as jpg

# Plot the chart.
pie(x, labels = piepercent, main = "City pie chart",col = rainbow(length(x)))
legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.8,
   fill = rainbow(length(x)))

# Save the file.
dev.off()
}

# pie_chart()


pie_chart3d <- function(){
# Get the library.
library(plotrix)

# Create data for the graph.
x <-  c(21, 62, 10,53)
lbl <-  c("London","New York","Singapore","Mumbai")

# Give the chart file a name.
png(file = "3d_pie_chart.jpg")

# Plot the chart.
pie3D(x,labels = lbl,explode = 0.1, main = "Pie Chart of Countries ")

# Save the file.
dev.off()
}

# pie_chart3d()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#The basic syntax to create a bar-chart in R is:
#barplot(H,xlab,ylab,main, names.arg,col)
if(FALSE){
   "H is a vector or matrix containing numeric values used in bar chart.
    xlab is the label for x axis.
    ylab is the label for y axis.
    main is the title of the bar chart.
    names.arg is a vector of names appearing under each bar.
    col is used to give colors to the bars in the graph."
}

bar_chart <- function(){
# Create the data for the chart
H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")

# Give the chart file a name
png(file = "barchart_months_revenue.png")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="blue",
main="Revenue chart",border="red")

# Save the file
dev.off()
}

# bar_chart()

group_bar_chart <- function(){
# Create the input vectors.
colors = c("green","orange","brown")
months <- c("Mar","Apr","May","Jun","Jul")
regions <- c("East","West","North")

# Create the matrix of the values.
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11), nrow = 3, ncol = 5, byrow = TRUE)

# Give the chart file a name
png(file = "barchart_stacked.png")

# Create the bar chart
barplot(Values, main = "total revenue", names.arg = months, xlab = "month", ylab = "revenue", col = colors)

# Add the legend to the chart
legend("topleft", regions, cex = 1.3, fill = colors)

# Save the file
dev.off()
}

# group_bar_chart()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#BOX PLOTS
#The below script will create a boxplot graph for the relation between
# mpg (miles per gallon) and cyl (number of cylinders).
boxplot1 <- function(){
# Give the chart file a name.
png(file = "boxplot.png")

# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
   ylab = "Miles Per Gallon", main = "Mileage Data")

# Save the file.
dev.off()
} #this function contains error

# boxplot1()

boxplot2 <- function(){
    # Give the chart file a name.
png(file = "boxplot_with_notch.png")

# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, 
   xlab = "Number of Cylinders",
   ylab = "Miles Per Gallon", 
   main = "Mileage Data",
   notch = TRUE, 
   varwidth = TRUE, 
   col = c("green","yellow","purple"),
   names = c("High","Medium","Low")
)
# Save the file.
dev.off()
}
# boxplot()
# input <- mtcars[,c('mpg','cyl')]
# print(head(input))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#hist(v,main,xlab,xlim,ylim,breaks,col,border)
if(FALSE){
    "v is a vector containing numeric values used in histogram.
    main indicates title of the chart.
    col is used to set color of the bars.
    border is used to set border color of each bar.
    xlab is used to give description of x-axis.
    xlim is used to specify the range of values on the x-axis.
    ylim is used to specify the range of values on the y-axis.
    breaks is used to mention the width of each bar."
}
histogram1 <- function(){
# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
png(file = "histogram.png")

# Create the histogram.
hist(v,xlab = "Weight",col = "yellow",border = "blue")

# Save the file.
dev.off()
}

# histogram1()

histogram2 <- function(){
# Create data for the graph.
v <- c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
png(file = "histogram_lim_breaks.png")

# Create the histogram.
hist(v,xlab = "Weight",col = "green",border = "red", xlim = c(0,40), ylim = c(0,5),
   breaks = 5)

# Save the file.
dev.off()
}

# histogram2()


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#plot(v,type,col,xlab,ylab)
if(FALSE){
    'v is a vector containing the numeric values.
    type takes the value "p" to draw only the points, 
    "l" to draw only the lines and "o" to draw both points and lines.
    xlab is the label for x axis.
    ylab is the label for y axis.
    main is the Title of the chart.
    col is used to give colors to both the points and lines.'
}
line_chart1 <- function(){
# Create the data for the chart.
v <- c(7,12,28,3,41)

# Give the chart file a name.
png(file = "line_chart_label_colored.jpg")

# Plot the bar chart.
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
   main = "Rain fall chart")

# Save the file.
dev.off()
}

line_chart1()

line_chart2 <- function(){
# Create the data for the chart.
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)

# Give the chart file a name.
png(file = "line_chart_2_lines.jpg")

# Plot the bar chart.
plot(v,type = "o",col = "red", xlab = "Month", ylab = "Rain fall", 
   main = "Rain fall chart")

lines(t, type = "o", col = "blue")

# Save the file.
dev.off()
}

line_chart2()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# plot(x, y, main, xlab, ylab, xlim, ylim, axes)
if(FALSE){
    "x is the data set whose values are the horizontal coordinates.
    y is the data set whose values are the vertical coordinates.
    main is the tile of the graph.
    xlab is the label in the horizontal axis.
    ylab is the label in the vertical axis.
    xlim is the limits of the values of x used for plotting.
    ylim is the limits of the values of y used for plotting.
    axes indicates whether both axes should be drawn on the plot."

    "When we have more than two variables and we want to find the correlation 
    between one variable versus the remaining ones we use scatterplot matrix. 
    We use pairs() function to create matrices of scatterplots."
    #pairs(formula, data)
    "formula represents the series of variables used in pairs.
    data represents the data set from which the variables will be taken."
}
scatter_plot <- function(){
# Get the input values.
input <- mtcars[,c('wt','mpg')]
print(head(input))
# Give the chart file a name.
png(file = "scatterplot.png")

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
   xlab = "Weight",
   ylab = "Milage",
   xlim = c(2.5,5),
   ylim = c(15,30),		 
   main = "Weight vs Milage"
)
	 
# Save the file.
dev.off()
}
# scatter_plot()

scatter_plot_matrices <- function(){
# Give the chart file a name.
png(file = "scatterplot_matrices.png")

# Plot the matrices between 4 variables giving 12 plots.

# One variable with 3 others and total 4 variables.

pairs(~wt+mpg+disp+cyl,data = mtcars,
   main = "Scatterplot Matrix")

# Save the file.
dev.off()
}
scatter_plot_matrices()

























