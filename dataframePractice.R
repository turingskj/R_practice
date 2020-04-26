
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



# reading text data

# read data into dataframe (tabular data like Excel)
# read.table() <-> write.table()
# read.csv()

# readLines() # read lines of a text file  <-> writeLines()

# source() # reading r script file  <-> inverse of dump()
# dget() # write R object (functions, data, etc) into a file
# dput() # read R object file

# unserialize()  # reading single R ojbect in binary form, not text file <-> serial

# load() # reading workspace data <-> save()

tDCS1_df <- read.table("Data/tDCS_exp1.csv", header = TRUE, sep =",", fileEncoding="UTF-8-BOM")
head(tDCS1_df)

# read.table or read.csv read data and any columns with character values would be
# converted to "factor". 
# you can spcify the class of variables with an option: colClasses = c("factor", "numeric")

tDCS1_df <- read.csv("Data/tDCS_exp1new.csv", header = TRUE, fileEncoding ="UTF-8-BOM")
                   
head(tDCS1_df, n=70)
str(tDCS1_df)

# note that fileEncoding = "UTF-8" or "UTF-8-BOM" depending the unicode encoding method 
# applied to the csv or text file. SPSS or Excel output usually add BOM to the CSV or
# text file. R needs to know this for encoding. 

# convert Variables to factors for analysis

tDCS1_df$Target <-factor(tDCS1_df$Target, levels = c(1, 2), labels = c("Absent", "Present"))
tDCS1_df$pre_post <-factor(tDCS1_df$pre_post, levels = c(1, 2), labels = c("PreTest", "PostTest"))
tDCS1_df$Stimulation <-factor(tDCS1_df$Stimulation, levels = 1:3, labels = c("Sham", "Anode", "Cathode"))
tDCS1_df$subject <-factor(tDCS1_df$subject, levels = 1:12)
tDCS1_df$Difficulty <-factor(tDCS1_df$Difficulty, levels = 1:3, labels = c("Easy", "Moderate", "Difficult"))

# change OriginalID variable to factor
temp1<-table(tDCS1_df$OriginalID) # tabulate by the value of OriginalID
temp1<-attributes(temp1)$dimnames[[1]] # get the list of table headings (levels)
tDCS1_df$OriginalID <-factor(tDCS1_df$OriginalID, levels = temp1)



numberR <- nrow(tDCS1_df)
head(tDCS1_df, n = 10L)
tail(tDCS1_df, n = 10L)
str(tDCS1_df)

