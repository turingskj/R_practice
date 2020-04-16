# R examples
# Git test
getwd()  # get the current working directory
setwd()  # set the new working directory

# runing external r script 
source("rcode.r")
# redirecting output to a file
sink("test.out")
# sink() will redirect to console output


# R object times
# numeric, integer, character, logical, complex

# Variable
# A variable starts with ".", like .var, is a global variable that cannot be shown by ls().
# one needs to put ls(all.names = TRUE)
ls(all.names = TRUE)
ls(name = .GlobalEnv, all.names= TRUE)
ls(name = "package:base", all.names = TRUE)

# R data type
# vector, matrix, list

# c() function creates a vector. If all members of c() is numeric, the result is a numeric vector.
# if all members are text string, result is an vector of strings. If members of c() is TURE or FALSE, the 
# result is logical. If the members of c() are mixed (string, numbers, etc.), the result is the vector of
# string.
# If the members of c() is mixed, highest type is slected: character > numeric > integer > logical

x <- c(1, 2.3, 2, 5, 2.2, 4L) #if mixed with numeric and interger, output is numeric

y <- c(1:10) # default integer output

z <-c(1:4, "text", 4.2)  # test stirng vector

z <-c(TRUE, FALSE, TRUE)  # logical output

z <-c(TRUE, 1.0, 3L)
class(z) # the result is numeric


# string
a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)


# using vector()
x <- vector(mode="numeric", length=10L)
y <- vector(mode = "integer", length = 3L)
z <- vector(mode="logical", length=3L)


# naming a vector
fruit <- c(1, 2, 3, 5, 6)
colnames(fruit)<-c("one", "two", "three", "four", "five")
# colnames will produce error since the fruit is a vector; it should be a matrix or dataframe

names(fruit)<-c("orange", "apple", "pear", "grape", "melon")
fruit
fruit["apple"]
fruit[c("apple", "melon")]





# use as.numeric(), as.integer(), as.character(), as.logical to change the class

a <-c(1, 2, 0, "1")
as.logical(a)
# [1] NA NA NA NA
a
#[1] "1" "2" "0" "1"

b <-as.logical(as.numeric(a))
b
# [1]  TRUE  TRUE FALSE  TRUE



# lsit() will create a list of objects with different class (integer, numeric, etc)
# use double bracket [[]] to acess the content of the list element
# single bracket will give you the object class, not the object itself
# therefore, list object does not have dimension, which means that a list object cannot have dimension names

a<-list("a", 23.2, 3L, "home", TRUE)
a[2]*2
# Error in a[2] * 2 : non-numeric argument to binary operator

a[[2]]*2
# [1] 46.4

print(a)

# c() coercion
# if c() includes text, vector, list, the list class is the final outcome
x <- c(list("text", 3), 3, "6") # creates a list of four items
y <- list("text", 3, 3, "6")  # also creates a list of four items
z <- list(list("text", 3), 3, "6")  # creates a list of two items. the first
                                  # item is a list of two items ("test", 3)
                                  # z[[1]][[1]] will gives "text" as string


str(x)  # check the structure of the variable

# use of double brackets for the list object
# as in Matlab cell object, list object in R can have another object
# within it. That is a list object can have a vector and string in it. 
# using a single bracket [] returns an object, not the values of the object
# this is similar to cell object in Matlab. In matlab, cell() returns 
# an object within a cell, while cell{} returns values of the objects in the cell

foo <- list( str='R', vec=c(1,2,3), bool=TRUE )
class(foo[1])
class(foo[[1]])

# Matrix is the same as vector with different dimensions

a <- matrix(1:10, nrow=2, ncol=5, byrow = FALSE)
print(a)
a[,3]
a[1, 2:3]
a[, 2:4]
a[, c(2, 5)]
a[-1, ]  # select all rows except 1

a[1, ] # this will give a vector, not matrix
a[1, , drop=FALSE] # this will give you a matrix of 1 by 5

# naming matrix dimensions. the name must be a list
mynames <- list(c("row1", "row2"), paste0("col", rep(c(1:5))))
dimnames(a) <- mynames
print(a)
# access matrix by names
a["row1", ] # first row of a
a[, c("col1", "col3")]

# another example
a<- matrix(1:10, nrow=2, byrow=TRUE)
b<-c(1:22)
c<-matrix(b, nrow=2)
View(c)


# another way to create a matrix
a <- 1:20
print(a)
dim(a) <- c(4, 5) # change the vector of length 20 to a matrix of 4 by 5
print(a)

# creating a matrix from vectors
a <-c(1:6)
b <-c(31:36)
c <-cbind(a, b)
print(c)

c <- rbind(a, b)
c <- rbind(c, c["b", ])
print(c)

rownames(c)[3] <-"c"
print(c)

# take a part of the matrix and make a new matrix with different dimension

k <- c[c("a"), ]
length(k) <- 12
dim(k) <- c(4, 3)
print(k)


# factors
# sample a data vector of 20 numbers between 1 and 6, and replace the values with 
# the labels using factor(). the order of the level is determined by "levels"
# Without explictly specifying, levels are sorted by alphabetically if characters.

x <- factor(sample(2:6, 20, replace=TRUE), levels = c(1:6), labels =
              c("one", "two", "three", "four", "five", "six"))
print(x)
table(x) # gives a frequency table based on the factor levels
unclass(x) # will give you original data (1, 2, 3, 4, 2, etc.)

x <- factor(c("one", "two", "three", "four", "five", "six"))
print(x) # note that factor levels are alphabetially sorted

x <- factor(c("two", "two", "three", "four", "five", "six"), levels =
              c("one", "two", "three", "four", "five", "six"))
print(x) # note that factor levels are in order of "levels"


x <- factor(sample(2:6, 20, replace=TRUE), levels = c(6:1), labels =
              c("one", "two", "three", "four", "five", "six"))
  # factor() correctly match the levels and labels. But this may not be true
  # for characters


# in the following example, the level "one" is labeled as "six"...
x <- factor(c("one", "one", "two", "four"), levels = 
              c("one", "two", "three", "four", "five", "six"), 
            labels =c("six", "two", "three", "four", "five", "one"))


# NA and NaN
is.na(c(1, 1, 2, NA)) # returns logical (TRUE and FALSE) for the data if NA exists
is.nan(c(1, 2, 2, NA, NaN))

# is.na() can also set an element of the data to "NA"
is.na(c) <-3:5 # set the 3rd to 5th element values to "NA"
c[is.na(c)] <-10 # find the cells with "NA" and replace with 10

## Table
# table() creates frequency table from the two or more variables.
# as.table() converts matrix or vector data as frequency table. the cross tabulation

sexbysmoke<-matrix(c(70,120,65,140),ncol=2,byrow=TRUE)
rownames(sexbysmoke)<-c("male","female")
colnames(sexbysmoke)<-c("smoke","nosmoke")
sexbysmoke <-as.table(sexbysmoke)
names(attributes(sexbysmoke)$dimnames) <- c("Sex", "Smoking") # adding dimension names

# or create table from the data and add dimension names
a <- c("Mon", "Tue","Wed", "Thur", "Wed", "Mon", "Sat")
b <- c(1, 2, 1, 3, 4, 2, 1)
table(a, b, dnn=list("Days", "Numbers"))

### R dataframe
# Data frame is like a collection of list objects but with dimensional informaiton
# therefore, elements of data frame can be mixed with different classes
# Also, dimenions can be named and factors can be found for string elements 
# Many functions, "read.csv(), read.table(), read.spss(), ..." read data as data frame
# change go matrix from data frame: data.matrix

# dataframe automaticallyl includes row and column names

# changing matrix to dataframe: as.data.frame()
# dataframe to matrix: data.matrix()







# using seq() and rep() for generating sequence

y <- seq(1, 30, by=2)
y <- seq(from=2, by=2, length=3)


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


a<-paste(c("X", "Y"), 1:10, sep="")
print(a)
b<-paste("X", 1:20, sep="")
a <- paste(c("x", "y"), rep(c(1, 2), each=2),sep="")
a <- paste0(c("x", "y"), rep(c(1, 2), each=2))   # this and the above line is the same


x <-c(1, 2, 3, 4, 5, 3, NA)
y <-x[!is.na(x)]
print(y)

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
b<-paste("simple", 2, "r", 323, sep="_") # paste combines all arguments as string. 
                             # its output can be assinged to a string variable. 


# exclude the first two elecments
b<-x[-(1:2)]





# empty nemeric and character variables
e<-numeric()
cc<-character()

e[3]<-4

# chaning the length of a variable
alpha <-c(1:10)
beta <-alpha[2*(1:5)]
beta <-alpha[c(1:3, 7:9)]
length(beta)<-3


z<-c(0:9)
digits <-as.character(z)
z<-as.integer(digits)






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






##### SPSS data processing related
# reading spss data


myfunctionX <- function(x, smean, mysd) {
  a <-pnorm(1.96, mean=smean, sd = mysd)
  print(a)
  
}
  