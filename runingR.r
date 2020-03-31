# R examples
# Git test
getwd()  # get the current working directory
setwd()  # set the new working directory


# c() function creates a list of vector with character string
x <- c(1, 2.3, 2, 5, 2.2, 4)

y <- c(1:10)

z <-c(1:4, "text", 4.2)

y <- seq(1, 30, by=2)
y <- seq(from=2, by=2, length=3)

# using vector()
x <- vector(mode="double", length=10L)
y <- vector(mode = "integer", length = 3L)
z <- vector(mode="logical", length=3L)

# creating a sequence of variable names using rep() and seq()
s <- rep(c(2, 3, 4), times=4)
s <-rep(x, each=3)
s <- rep(seq(from=2, to=6, by=2), times=2)
s <- rep(seq(from=2, to=6, by=2), each=2)

x<-c("x", "y", "z")
x[rep(c(1, 2, 2, 3), times=2)]
rep(c(x[1], x[2], x[2], x[3]), times=2)


a <- c(1, 2, 1, 2, 4)
a2 <- c(1:20)
a3 <- seq(from=1, to=20, by=2)
b <- c(2, 4, 3, 21, 4)
a33 <- rbind(a, b)
a34 <- cbind(a, b)


max(a)
pmax(a, b)

a2<- rep(a2, each = 1, times=2)

is.na(c(1, 1, 2, NA))
is.nan(c(1, 2, 2, NA, NaN))

a<-paste(c("X", "Y"), 1:10, sep="")
b<-paste("X", 1:20, sep="")
a = paste(c("x", "y"), rep(c(1, 2), each=2),sep="")


x <-c(1, 2, 3, 4, 5, 3, NA)
y <-x[!is.na(x)]

x<-c(2,2,3,1,-2,NA)
y <-(x+1)[!is.na(x) & x>0]

x<-c("x", "y", "z")
x[(x=="z")]<-"k"
x[c(x=="k")]<-"z"


a<-c("x", "y")
a[1]
b<-a[1:2]
b <-a[c(1, 2, 2, 1)]

y<-seq(from=-4, to=6, by=2)
z<-y[y<0]
y[y<0] <- y[y<0]+3

b<-a[rep(c(1,2,2,1), times=1)] 

# difference between c, cat, and paste
a<-c(1, 2, 3)  # c function simply combines the arguments as an output (assinged to a variable)
cat("1, 2, 3\n") # cat only prints or save to file. does not return as a variable. 
               # therefore, you cannot assign a variable to the output of cat
b<-paste("simple", 2, "r", 323) # paste combines all arguments as string. 
                             # its output can be assinged to a string variable. 


# exclude the first two elecments
b<-x[-(1:2)]


# naming a vector
fruit <- c(1, 2, 3, 5, 6)
colnames(fruit)<-c("one", "two", "three", "four", "five")
# colnames will produce error since the fruit is a vector; it should be a matrix or dataframe

names(fruit)<-c("orange", "apple", "pear", "grape", "melon")
fruit
fruit["apple"]
fruit[c("apple", "melon")]


# empty nemeric and character variables
e<-numeric()
cc<-character()

e[3]<-4

# chaning the length of a variable
alpha <-c(1:10)
alpha <-alpha[2*(1:5)]
length(alpha)<-3


z<-c(0:9)
digits <-as.character(z)
z<-as.integer(digits)



# string
a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)



# Using paste() to manipulate strings

a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c, sep = "", collapse = ""))


# change numbers to string with format

# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)

# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)


# other string related functions
result <- nchar("Count the number of characters")
print(result)
# Changing to Upper case.
result <- toupper("Changing To Upper")
print(result)

# Changing to lower case.
result <- tolower("Changing To Lower")
print(result)

# Extract characters from 5th to 7th position.
result <- substring("Extract", 5, 7)
print(result)


# creating a matrix
a<- matrix(1:10, nrow=2, byrow=TRUE)
b<-c(1:22)
c<-matrix(b, nrow=2)
View(c)


# use of double brackets for the list object
# as in Matlab cell object, list object in R can have another object
# within it. That is a list object can have a vector and string in it. 
# using a single bracket [] returns an object, not the values of the object
# this is similar to cell object in Matlab. In matlab, cell() returns 
# an object within a cell, while cell{} returns values of the objects in the cell

foo <- list( str='R', vec=c(1,2,3), bool=TRUE )
class(foo[1])
class(foo[[1]])

##### SPSS data processing related
# reading spss data