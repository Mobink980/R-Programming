#statistical analysis in R is performed by many built in functions

 meanfunc <- function(){
#mean(x, trim = 0, na.rm = FALSE, ...)
# Create a vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
# Find Mean.
result.mean <- mean(x)
print(result.mean)
#When trim parameter is supplied, the values in the vector get sorted 
#and then the required numbers of observations are dropped from calculating the mean.
#applying the trim function
#When trim = 0.3, 3 values from each end will be dropped from the calculations to find mean
result.mean <-  mean(x,trim = 0.3)
print(result.mean)

#If there are missing values, then the mean function returns NA.
#To drop the missing values from the calculation use na.rm = TRUE. which means remove the NA values.
# Create a vector. 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)

# Find mean.
result.mean <-  mean(x)
print(result.mean)

# Find mean dropping NA values.
result.mean <-  mean(x,na.rm = TRUE)
print(result.mean)
 }
#  meanfunc()

 medianfunc <- function(){
#median(x, na.rm = FALSE)
# Create the vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find the median.
median.result <- median(x)
print(median.result)
 }
#  medianfunc()

#Unike mean and median, mode can have both numeric and character data.
# This function takes the vector as input and gives the mode value as output
modefunc <- function(){
# Create the function.
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)

# Calculate the mode using the user function.
result <- getmode(v)
print(result)

# Create the vector with characters.
charv <- c("o","it","the","it","it")

# Calculate the mode using the user function.
result <- getmode(charv)
print(result)
}
# modefunc()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Regression analysis is a very widely used statistical tool 
# to establish a relationship model between two variables.
#one of the variables are called predictor variable which its values are gathered through the experiment
#the other variable is called response variable which its values are derived from the other variable
#y= ax + b 
# y ==> response variable
# x ==> predictor variable
if(FALSE){
    "The steps to create the relationship is :
==>Carry out the experiment of gathering a sample of observed values of height and corresponding weight.
==>Create a relationship model using the lm() functions in R.
==>Find the coefficients from the model created and create the mathematical equation using these
==>Get a summary of the relationship model to know the average error in prediction. Also called residuals.
==>To predict the weight of new persons, use the predict() function in R."

"# Values of height
151, 174, 138, 186, 128, 136, 179, 163, 152, 131

# Values of weight.
63, 81, 56, 91, 47, 57, 76, 72, 62, 48"
}

#lm() in linear regression syntax: lm(formula,data)
# formula is a symbol presenting the relation between x and y.
# data is the vector on which the formula will be applied.

linear_regression <- function(){
# The predictor vector. (height)
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
# The resposne vector. (weight)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

# print(relation)
# print(summary(relation)) #summary of the relationship

# predict(object, newdata)
# object is the formula which is already created using the lm() function.
# newdata is the vector containing the new value for predictor variable

# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)

#************************************************************ chart of the regression line
# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# Save the file.
dev.off()
#*****************************************************************
}
# linear_regression()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Nonlinear regression
if(FALSE){
" In Least Square regression, we establish a regression model in which the sum of the squares of the vertical distances 
 of different points from the regression curve is minimized. We generally start with a defined model and assume some values 
 for the coefficients. We then apply the nls() function of R to get the more accurate values along with the confidence intervals."
#nls(formula, data, start)
"formula is a nonlinear model formula including variables and parameters.
data is a data frame used to evaluate the variables in the formula.
start is a named list or named numeric vector of starting estimates."

#We will consider a nonlinear model with assumption of initial values of its coefficients
#Next we will see what is the confidence intervals of these assumed values so that we can judge how well these values fit into the model.
}

# We consider the equation a = b1*x^2+b2 for this purpose, and 1 and 3 for the coefissients and fit these values into nls() function
nonlinear_regression <- function(){
xvalues <- c(1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,1.19,2.21)
yvalues <- c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)

# Give the chart file a name.
png(file = "nls.png")

# Plot these values.
plot(xvalues,yvalues)

# Take the assumed values and fit into the model.
model <- nls(yvalues ~ b1*xvalues^2+b2,start = list(b1 = 1,b2 = 3))

# Plot the chart with new data by fitting it to a prediction from 100 data points.
new.data <- data.frame(xvalues = seq(min(xvalues),max(xvalues),len = 100))
lines(new.data$xvalues,predict(model,newdata = new.data))

# Save the file.
dev.off()

# Get the sum of the squared residuals.
print(sum(resid(model)^2))

# Get the confidence intervals on the chosen values of the coefficients.
print(confint(model))
}
# nonlinear_regression()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# in multiple regression we have more than one predictor variable and one response variable.
# The general mathematical equation for multiple regression is −
# y = a + b1x1 + b2x2 +...bnxn (y ==> response  (x1,x2,x3,..) ==> predictors)
#lm() function creates the relationship model between the predictor and the response variable
if(FALSE){
    'Consider the data set "mtcars" available in the R environment.
    It gives a comparison between different car models in terms of mileage per gallon (mpg),
    cylinder displacement("disp"), horse power("hp"), weight of the car("wt") and some more parameters
    The goal of the model is to establish the relationship between "mpg" as a response variable
     with "disp","hp" and "wt" as predictor variables'
}
multiple_regression <- function(){
input <- mtcars[,c("mpg","disp","hp","wt")]
print(head(input))

# Create the relationship model.
model <- lm(mpg~disp+hp+wt, data = input)

# Show the model.
# print(model)

# Get the Intercept and coefficients as vector elements.
cat("# # # # The Coefficient Values # # # ","\n")

a <- coef(model)[1]
print(a)

Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]

print(Xdisp)
print(Xhp)
print(Xwt)

# creating the equation for the regression model
#we want to create the mathematical equation 
# Y = a+Xdisp.x1+Xhp.x2+Xwt.x3
# or
# Y = 37.15+(-0.000937)*x1+(-0.0311)*x2+(-3.8008)*x3

# Applying equation for prediting new values
a <- data.frame(disp = 190,hp=100,wt=3)
result <-  predict(model,a)
print(result)
}
# multiple_regression()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#The Logistic Regression is a regression model in which the response variable (dependent variable) 
#has categorical values such as True/False or 0/1. 
#It actually measures the probability of a binary response as the value of response variable 
#based on the mathematical equation relating it with the predictor variables
if(FALSE){
    "The general mathematical equation for logistic regression is y = 1/(1+e^-(a+b1x1+b2x2+b3x3+...))"
    "y is the response variable.
    x is the predictor variable.
    a and b are the coefficients which are numeric constants"
    #to create logistic regression model, we use glm() function, glm(formula,data,family)
    "formula is the symbol presenting the relationship between the variables.
    data is the data set giving the values of these variables.
    family is R object to specify the details of the model. It's value is binomial for logistic regression."

'The built-in data set "mtcars" describes different models of a car with their
 various engine specifications. In "mtcars" data set, the transmission mode (automatic or manual)
  is described by the column am which is a binary value (0 or 1). We can create a 
  logistic regression model between the columns "am" and 3 other columns - hp, wt and cyl.'
}
logistic_regression <- function(){
    # Select some columns form mtcars.
input <- mtcars[,c("am","cyl","hp","wt")]
print(head(input))
am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)
# print(summary(am.data))

# Applying equation for prediting new values
a <- data.frame(cyl = 7,hp=200,wt=3.65)
result <-  predict(am.data,a)
print(result) #does not print 1 or 0!

}
# logistic_regression()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(FALSE){ #Possion
    "poisson Regression involves regression models in which the response variable is 
    in the form of counts and not fractional numbers. For example, the count of number 
    of births or number of wins in a football match series. 
    Also the values of the response variables follow a Poisson distribution"

    #log(y) = a + b1x1 + b2x2 + bnxn.....
    "y is the response variable.
    a and b are the numeric coefficients.
    x is the predictor variable."
#possion regression is created by glm() function, glm(formula,data,family)
    "formula is the symbol presenting the relationship between the variables.
    data is the data set giving the values of these variables.
    family is R object to specify the details of the model. It's value is 'Poisson' for Logistic Regression."

}

poisson_regression <- function(){
# We have the built-in data set "warpbreaks" which describes the effect of wool type (A or B) and tension (low, medium or high) 
# on the number of warp breaks per loom. Let's consider "breaks" as the response variable 
# which is a count of number of breaks. The wool "type" and "tension" are taken as predictor variables
    input <- warpbreaks
print(head(input))
output <-glm(formula = breaks ~ wool+tension, data = warpbreaks,
   family = poisson)
# print(summary(output))

# Applying equation for prediting new values (does not work)
#make a datframe with new data 
# library(caret)
# newdata = data.frame(wool="B", tension="M")#use 'predict() to run model on new data
# result <- predict(input, newdata = newdata, type = "response")
# print(result)
}
# poisson_regression()
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# R has four built-in functions to generate normal distribution. They are described below.
if(FALSE){
    "dnorm(x, mean, sd)
    pnorm(x, mean, sd)
    qnorm(p, mean, sd)
    rnorm(n, mean, sd)"

    "x is a vector of numbers.
    p is a vector of probabilities.
    n is number of observations(sample size).
    mean is the mean value of the sample data. It's default value is zero.
    sd is the standard deviation. It's default value is 1."

}
#dnorm() function gives height of the probability distribution at each point
#for a given mean and standard deviation.

dnorm_func <- function(){
    # Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)

# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 2.5, sd = 0.5)

# Give the chart file a name.
png(file = "dnorm.png")

plot(x,y)
# Save the file.
dev.off()
}
# dnorm_func()

#***************************************************************************
#pnorm() function gives the probability of a normally distributed random number 
#to be less than the value of a given number. It is also called "Cumulative Distribution Function
pnorm_func <- function(){
    # Create a sequence of numbers between -10 and 10 incrementing by 0.2.
x <- seq(-10,10,by = .2)
 
# Choose the mean as 2.5 and standard deviation as 2. 
y <- pnorm(x, mean = 2.5, sd = 2)

# Give the chart file a name.
png(file = "pnorm.png")

# Plot the graph.
plot(x,y)

# Save the file.
dev.off()
}
# pnorm_func()

#***************************************************************************
# qnorm() function takes the probability value and 
# gives a number whose cumulative value matches the probability value.
qnorm_func <- function(){
# Create a sequence of probability values incrementing by 0.02.
x <- seq(0, 1, by = 0.02)

# Choose the mean as 2 and standard deviation as 1.
y <- qnorm(x, mean = 2, sd = 1)

# Give the chart file a name.
png(file = "qnorm.png")

# Plot the graph.
plot(x,y)

# Save the file.
dev.off()
}
# qnorm_func()

#***************************************************************************
# rnorm() function is used to generate random numbers whose distribution is normal. 
# It takes the sample size as input and generates that many random numbers. 
# We draw a histogram to show the distribution of the generated numbers.

rnorm_func <- function(){
# Create a sample of 50 numbers which are normally distributed.
y <- rnorm(50)

# Give the chart file a name.
png(file = "rnorm.png")

# Plot the histogram for this sample.
hist(y, main = "Normal DIstribution")

# Save the file.
dev.off()
}
# rnorm_func()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(FALSE){
    "The binomial distribution model deals with finding the probability of success 
    of an event which has only two possible outcomes in a series of experiments. 
    For example, tossing of a coin always gives a head or a tail. 
    The probability of finding exactly 3 heads in tossing a coin repeatedly 
    for 10 times is estimated during the binomial distribution."

# R has four in-built functions to generate binomial distribution. They are described below.
    "dbinom(x, size, prob)
    pbinom(x, size, prob)
    qbinom(p, size, prob)
    rbinom(n, size, prob)"

    "x is a vector of numbers.
    p is a vector of probabilities.
    n is number of observations.
    size is the number of trials.
    prob is the probability of success of each trial."
}

# dbinom() function gives the probability density distribution at each point.
dbinom_func <- function(){
# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)

# Create the binomial distribution.
y <- dbinom(x,50,0.5) #50 trials with 1/2 chance of success

# Give the chart file a name.
png(file = "dbinom.png")

# Plot the graph for this sample.
plot(x,y)

# Save the file.
dev.off()
}
# dbinom_func()

# pbinom() function gives the cumulative probability of an event. 
# It is a single value representing the probability.
pbinom_func <- function(){
# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)

print(x)
}
# pbinom_func()

# qbinom() function takes the probability value and gives a number 
# whose cumulative value matches the probability value.
qbinom_func <- function(){
# How many heads will have a probability of 0.25 will come out when a coin
# is tossed 51 times.
x <- qbinom(0.25,51,1/2)

print(x)
}
# qbinom_func()

# rbinom() function generates required number of random values of given probability from a given sample.
rbinom_func <- function(){
# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,.4)

print(x)
}
# rbinom_func()

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#ANCOVA Analysis
if(FALSE){
'Create a data frame containing the fields "mpg", "hp" and "am" from the data set mtcars.
Here we take "mpg" as the response variable, "hp" as the predictor variable and "am" as the categorical variable.'
'We create a regression model taking "hp" as the predictor variable and "mpg" as the response variable 
taking into account the interaction between "am" and "hp".'
}

ancova <- function(){
# Get the dataset.
input <- mtcars

# Create the regression model. (Model with interaction between categorical variable and predictor variable)
result1 <- aov(mpg~hp*am,data = input)
# print(summary(result1))

# Create the regression model. (Model without interaction between categorical variable and predictor variable)
result2 <- aov(mpg~hp+am,data = input)
# print(summary(result2))

# Compare the two models.
print(anova(result1,result2))
# As the p-value is greater than 0.05(0.9806) we conclude that the interaction between horse power and transmission type is not significant. 
# So the mileage per gallon will depend in a similar manner on the horse power of the car in both auto and manual transmission mode.
}
ancova()
# input <- mtcars[,c("am","mpg","hp")]
# print(head(input))


























