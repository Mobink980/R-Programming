myLoopFunction <- function(){ #function with no argument
x <- c("what","is","truth")

if("Truth" %in% x) { #if-else statement
   print("Truth is found")
} else {
   print("Truth is not found")
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#In switch statement
#If the value of expression is not a character string it is coerced to integer
#there is no default, and if there are more than one match, the first one is returned
x <- switch( 
   2,
   "first",
   "second",
   "third",
   "fourth"
)
print(x)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v <- c("Hello","loop")
cnt <- 2

repeat { #repeat statement (like a recursive function)
   print(v)
   cnt <- cnt+1
   
   if(cnt > 5) {
      break
   }
}

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (cnt < 7) { #while statement
   print(v)
   cnt = cnt + 1
}

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v <- LETTERS[1:6]
for ( i in v) { #for statement
    if (i == "D") {
      next
   }
   print(i)
}
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Built-in functions
myBuilt_in_function <- function(){
# Create a sequence of numbers from 32 to 44.
print(seq(32,44))

# Find mean of numbers from 25 to 82.
print(mean(25:82))

# Find sum of numbers frm 41 to 68.
print(sum(1:10))
}
# Create a function to print squares of numbers in sequence.
new.function <- function(a) {
   for(i in 1:a) {
      b <- i^2
      c <- 2*b
      print(c)
   }
}

# Call the function new.function supplying 6 as an argument.
new.function(3)

myfunction <- function(a=1,b=2,c=3){ #we can determine default values
    result <- a+b*c
    print(result)   
}

# Call the function by position of arguments.
myfunction(5,3,11)

# Call the function by names of the arguments.
myfunction(a = 11, b = 5, c = 3)

# Call the function without giving any argument.
myfunction()









