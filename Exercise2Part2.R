#set working directory
setwd("C:/Users/Tiania/Desktop/UMGC/Data 630/Week1and2/DataPreprocessingwithCars")
#call arules package
library(arules)
#load cars csv
creditapproval<-read.csv(file="CreditApproval.csv", header=TRUE, sep=",", as.is = FALSE)
# preview data
head(creditapproval,10)
