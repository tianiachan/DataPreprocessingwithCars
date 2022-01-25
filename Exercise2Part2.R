#set working directory
setwd("C:/Users/Tiania/Desktop/UMGC/Data 630/Week1and2/DataPreprocessingwithCars")
#call arules package
library(arules)
#load cars csv
creditapproval<-read.csv(file="CreditApproval.csv", header=TRUE, sep=",", as.is = FALSE)
# preview data
head(creditapproval,10)
#display dataframe structure
str(creditapproval)
#show summary of data
summary(creditapproval)
#discretization methods
summary(creditapproval$Age)
creditapproval$Age <-discretize(creditapproval$Age, method = "interval", breaks = 5)
summary(creditapproval$Age)
summary(creditapproval$YearsEmployed)
creditapproval$YearsEmployed <- discretize(creditapproval$YearsEmployed, method = "cluster", breaks = 5)
summary(creditapproval$YearsEmployed) # need to change this
