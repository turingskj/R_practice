
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

mydata2 <- mydata["sex"]  # select "sex" column

print(mydata2)

# changing variable (column) names
names(mydata)  # will gives you a vector of characters
names(mydata)[1] <- "year" # changes the first variable "mynum" to "year"
mydata


# or, to be safe, instead of the number, we can find the variable name and replace it
names(mydata)[names(mydata)=="year"] <- "Year"
names(mydata)[names(mydata)=="sex"] <- "Sex"
# add a new variable
mydata$country <- c(rep(c("US", "KR"), times=1, each=3))
head(mydata)

# creating variable names and assign to the dataframe
data2 <- data.frame(Group = paste0(rep(c("NC", "SZ", "BD"), each=10), sprintf("_%02d",seq(1:10))))
data2

# add an variable
data2["RT"] <- c(21:50)
str(data2)
data2

# reading text data

# read data into dataframe (tabular data like Excel)
# read.table() <-> write.table()
# read.csv() <-> write.csv()

# readLines() # read lines of a text file  <-> writeLines()
data1 <- readLines("Data/tDCS_exp1.csv", n=2, encoding = "UTF-8");
head(data1)

# source() # reading r script file  <-> inverse of dump()
# dput() # write R object (functions, data, etc) into a file
# dget() # read R object file


# unserialize()  # reading single R ojbect in binary form, not text file <-> serial

# load() # reading workspace data <-> save()


# read.table or read.csv read data and any columns with character values would be
# converted to "factor". 
# you can spcify the class of variables with an option: colClasses = c("factor", "numeric")
tDCS1_df <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM")
head(tDCS1_df)

# setting category of columns as factors or numeric
tDCS1_df <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM", 
                       colClasses =c("factor", "factor", "factor", "factor", "factor",
                                     "factor", "numeric"))
head(tDCS1_df)


tDCS1_df <- read.csv("Data/tDCS_exp1new.csv", header = TRUE, fileEncoding ="UTF-8-BOM", comment.char = "")
                   
head(tDCS1_df, n=20)
str(tDCS1_df)

# note that fileEncoding = "UTF-8" or "UTF-8-BOM" depending the unicode encoding method 
# applied to the csv or text file. SPSS or Excel output usually add BOM to the CSV or
# text file. R needs to know this for encoding. 

# convert Variables to factors with meaningful names for analysis

tDCS1_df$Target <-factor(tDCS1_df$Target, levels = c(1, 2), labels = c("Absent", "Present"))
tDCS1_df$pre_post <-factor(tDCS1_df$pre_post, levels = c(1, 2), labels = c("PreTest", "PostTest"))
tDCS1_df$Stimulation <-factor(tDCS1_df$Stimulation, levels = 1:3, labels = c("Sham", "Anode", "Cathode"))
tDCS1_df$subject <-factor(tDCS1_df$subject, levels = 1:12)
tDCS1_df$Difficulty <-factor(tDCS1_df$Difficulty, levels = 1:3, labels = c("Easy", "Moderate", "Difficult"))

# change OriginalID variable to factor

temp1<-table(tDCS1_df$OriginalID) # tabulate by the value of OriginalID
print(temp1)
# temp1<-attributes(temp1)$dimnames[[1]] # get the list of table headings (levels)
# temp1 <- names(temp1)
tDCS1_df$OriginalID <-factor(tDCS1_df$OriginalID, levels = names(temp1))

str(tDCS1_df)
table(tDCS1_df$OriginalID)

# note on double brackets
# tDCS1_df[1] returns another dataframe with one variable; OriginalID
# str(tDCS1_df[1]) or str(tDCS_df["OriginalID"])

# but the tDCS1_df[[1]] will return a vector of values
# str(tDCS1_df[[1]]) or str(tDCS1_df[["OriginalID"]])

# also, tDCS1_df[[1]][33] will show 33rd row data of the first variable. 
#  or   tDCS1_df$OriginalID[33]

# tDCS1_df[1]$OriginalID is the same as tDCS1_df[["OriginalID"]]


tDCS1_df <- read.csv("Data/tDCS_exp1new.csv", header = TRUE, fileEncoding ="UTF-8-BOM")

head(tDCS1_df, n=20)
str(tDCS1_df)

for (myvar in seq(1:6)) {   # change the first 6 variables to factor
  # or it can go like this: for (myvar in names(tDCS1_df))
  #              then get each variable with double brackets 
  #                       tDCS1_df[[myvar], which is equivalent to tDCS1_df[["subject"]]

  if (myvar == 1) {        # Original ID variable. IDs are not sequence.
    temp1<-table(tDCS1_df[[1]]) # tabulate by the value of OriginalID
    temp1 <- names(temp1)
    
    mylevels <- temp1
    mylabels = temp1
    
  } else  if (myvar == 5) {                           # Target variable
    mylevels <- c(1, 2)
    mylabels = c("Absent", "Present")
    
  } else if (myvar == 2) {                   # subject
    mylevels = c(1:12)
    mylabels = c(1:12)
    
  } else if (myvar == 3) {    # stimulation
    mylevels <- c(1, 2, 3)
    mylabels = c("Sham", "Anode", "Cathode")
    
  } else if (myvar == 4) {       # pre & post test condition
    mylevels <- c(1, 2)
    mylabels = c("PreTest", "PostTest")
    
  } else if (myvar == 6) {              # difficulty condition
    mylevels <- c(1, 2, 3)
    mylabels = c("Easy", "Moderate", "Difficult")
    
  } else {
    
  }
    
  # change the first 6 variable to factor
  
  tDCS1_df[[myvar]] <- factor(tDCS1_df[[myvar]], levels = mylevels, labels = mylabels)
  
}
  
str(tDCS1_df)



# setting the classes for each variable
# read.table or read.csv spend much time to figure out the class of each column. 
# if the data file is too large, we can make it quick like this
# read the first 10 data and find the classes. then apply the classes to the data with 
# colClasses option for read.table so that R does not have to read all data and figure out 
# the classes...

first100 <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM", 
                       nrows = 100)

foundclasses <- lapply(first100, class) # Returns a list with names. not easy to use
foundclasses <-unlist(foundclasses) # make the list a vector with names
Alldata <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM", 
                      colClasses = foundclasses)

str(Alldata)

# Or use sapply
first10 <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM", 
                       nrows = 10)

foundclasses <- sapply(first10, class)
print(foundclasses)  # returns a character vector representing class with names

# if you want to change the class to others, try below and read the whole data again and appy 
# colClasses option
library(stringr)
foundclasses <-gsub("integer", "factor", foundclasses) # change the integer class to factor class
                                                       # do not change the numeric class for RT variable
print(foundclasses)

# read the whole data again to load the data with the right class names 
Alldata <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM", 
                      colClasses = foundclasses)

numberR <- nrow(Alldata)
head(Alldata, n = 10L)
tail(Alldata, n = 10L)
str(Alldata)

# change the order of OriginalID factor. since the factor order is determined by the 
# order in the data, it is easy to see if the factor levels are ordered. 


temp1<-table(Alldata$OriginalID) # tabulate by the value of OriginalID
temp1 = str_sort(names(temp1), numeric = TRUE)
Alldata$OriginalID
Alldata$OriginalID <-factor(Alldata$OriginalID, levels = temp1)

# we still need to change the factor levels with meaningful words, rather than numbers
Alldata$Target <-factor(Alldata$Target, levels = c(1, 2), labels = c("Absent", "Present"))
Alldata$pre_post <-factor(Alldata$pre_post, levels = c(1, 2), labels = c("PreTest", "PostTest"))
Alldata$Stimulation <-factor(Alldata$Stimulation, levels = 1:3, labels = c("Sham", "Anode", "Cathode"))
Alldata$subject <-factor(Alldata$subject, levels = 1:12)
Alldata$Difficulty <-factor(Alldata$Difficulty, levels = 1:3, labels = c("Easy", "Moderate", "Difficult"))

str(Alldata)


# dump() will save variable or object as if it was generated by R code
# source() will read the dumped file as if R script

dump("foundclasses", "foundc.r")
# this will save the following command in "found.r" file

foundclasses <-
c(OriginalID = "integer", subject = "integer", Stimulation = "integer", 
  pre_post = "integer", Target = "integer", Difficulty = "integer", 
  RT = "numeric")

# dput() will do the same thing as dump() but on the console. dget
# dput(a, file="aaas.r") will ave it to a file.
# dget("aaas.r") will recover it
# dget and dput only works with a single object



## structure function: produce a certain sturcture with options
# following creates a list structure and covert one of the variables to factor

y <- structure(list(a = 1, b = 2), names = list("aa", "bb"))
str(y)
y$bb <- factor(y$bb, levels = c(1,2), labels = c("one", "two"))
print(y)

y <- structure(list(a = c(1:3), b = structure(c(2, 3, 3), class ="factor", levels = c(1:3), 
                                              .Label = c("one", "two", "three"))),
               row.names = c(NA, -3), class="data.frame")

str(y)


y <- structure(list(a = c(1:10), b = LETTERS[1:10]), names = list("aa", "bb"), class="data.frame")
y <- structure(data.frame(a = c(1:10), b = LETTERS[1:10]), names = list("aa", "bb"))
str(y)


print(y)


dput(y, "test.r")

dd <- structure(list( 
  year = c(2001, 2002, 2004, 2006) 
  ,length_days = c(366.3240, 365.4124, 366.5323423, 364.9573234)) 
  ,.Names = c("year", "length of days") 
  ,row.names = c(NA, -4L) 
  ,class = "data.frame")

print(dd)

dump(c("y", "dd"), "test.r")





# Subsetting

tDCS1_df2 <- tDCS1_df[-1] # remove the first variable
head(tDCS1_df2, n=15)
head(tDCS1_df2, n=-410)

tDCS1_df2 <- tDCS1_df[c(-1, -3)] # remove the first and third variable
head(tDCS1_df2)

myvar <- names(tDCS1_df)[c(2:5, 7)] # select 2,3,4,5, and 7th variables
tDCS1_df3 <- tDCS1_df[myvar]
head(tDCS1_df3)

myvar <- names(tDCS1_df)[2:7] # 
tDCS1_df3 <- tDCS1_df[myvar]
head(tDCS1_df3)

tDCS1_df3 <-tDCS1_df[c("RT", "subject", "Difficulty")]
head(tDCS1_df3)

tDCS1_df3 <-tDCS1_df[c("RT", "subject", "Difficulty")]
head(tDCS1_df3)

# subsetting

tDCS1_df3 <- subset(tDCS1_df, select=-OriginalID)
head(tDCS1_df3)

tDCS1_df3 <- subset(tDCS1_df, select=subject:RT)
head(tDCS1_df3)

tDCS1_df3 <-subset(tDCS1_df, select=c(subject, RT))
head(tDCS1_df3)

tDCS1_df3 <-subset(tDCS1_df, Stimulation==c("Anode", "Sham"), select=c(subject, Stimulation, Target, RT))
head(tDCS1_df3, n=20)

tDCS1_df3 <-subset(tDCS1_df, Stimulation==c("Anode", "Sham") & RT < 400, select=c(subject, Stimulation, Target, RT))
head(tDCS1_df3, n=20)

