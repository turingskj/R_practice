
# Data frame is like a collection of list objects but with dimensional informaiton
# therefore, elements of data frame can be mixed with different classes
# Also, dimenions can be named and factors can be found for string elements 
# Many functions, "read.csv(), read.table(), read.spss(), ..." read data as data frame
# change go matrix from data frame: data.matrix

# dataframe automaticallyl includes row and column names
# basic creation method: data.frame

# changing matrix to dataframe: as.data.frame()
# dataframe to matrix: data.matrix()

mynum <-c(1, 2, 4, 1, 2, 34)
sex <-c(rep(c("M", "F"), times=length(mynum)/2))
mydata <- data.frame(mynum, sex)
print(mydata)

# changing variable (column) names
names(mydata)  # will gives you a vector of characters
names(mydata)[1] <- "year" # changes the first variable "mynum" to "year"

# or, to be safe, instead of the number, we can find the variable name and replace it
names(mydata)[names(mydata)=="year"] <- "Year"
names(mydata)[names(mydat)=="sex"] <- "Sex"
# add a new variable
mydata$country <- c(rep(c("US", "KR"), times=3))


data2 <- data.frame(Group = paste0(rep(c("NC", "SZ", "BD"), each=10), sprintf("_%02d",seq(1:10))))
data2

