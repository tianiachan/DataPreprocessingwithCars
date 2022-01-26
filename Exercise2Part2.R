#set working directory
setwd("C:/Users/Tiania/Desktop/UMGC/Data 630/Week1and2/DataPreprocessingwithCars")
#call arules package
library(arules)
#load creditapproval csv
creditapproval<-read.csv(file="CreditApproval.csv", header=TRUE, sep=",", as.is = FALSE)
# preview data
head(creditapproval,10)
#display dataframe structure
str(creditapproval)
#show summary of data
summary(creditapproval)
#discretization methods
#interval
summary(creditapproval$Age)
creditapproval$Age <-discretize(creditapproval$Age, method = "interval", breaks = 5)
summary(creditapproval$Age)
#cluster
summary(creditapproval$YearsEmployed)
creditapproval$YearsEmployed <- discretize(creditapproval$YearsEmployed, method = "cluster", breaks = 5)
summary(creditapproval$YearsEmployed) # did not work well, should use 
#frequency
summary(creditapproval$Debt)
creditapproval$Debt <- discretize(creditapproval$Debt, method ="frequency", breaks = 5)
summary(creditapproval$Debt)
#delete a dataset  variable
#start clean
creditapproval2<-read.csv(file="CreditApproval.csv", header=TRUE, sep=",", as.is = FALSE)
#"delete one variable, variable 16
creditshort <- creditapproval2 [,-2]
str(creditshort)
#show where missing values
View(creditapproval2[!complete.cases(creditapproval2),])
#get count of missing values for each variable
nrow(creditapproval2[!complete.cases(creditapproval2),])
#nrow(creditapproval2[!complete.cases(creditapproval2$Married),])
#nrow(creditapproval2[!complete.cases(creditapproval2$BankCustomer),])
#nrow(creditapproval2[!complete.cases(creditapproval2$EducationLevel),])
#nrow(creditapproval2[!complete.cases(creditapproval2$Ethnicity),])
#sum(is.na(creditapproval2$Married))
#View(creditapproval2)
apply(creditapproval2,2,function(creditapproval2)sum(is.na(creditapproval2)))
#replace null  values in Age with the mean in Age
creditapproval2$Age[is.na(creditapproval2$Age)]<- mean(creditapproval2$Age, na.rm=TRUE)
apply(creditapproval2,2,function(creditapproval2)sum(is.na(creditapproval2)))
#sort by credit score
credit_sorted <-creditapproval2[order(creditapproval2$CreditScore),]
head(credit_sorted)
#lets plot out the age 
plot(table(creditapproval2$Age), type="h", col = "dark green")
