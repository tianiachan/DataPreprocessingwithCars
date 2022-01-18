# 1. Loading Data in R
# Set working directory and read the data
# replace F:/Datasets with the file location on your hard drive
setwd("F:/Datasets")
# display the file names in the current working directory
dir()
# Read the cars.csv file
cars<-read.csv(file="cars.csv", header=TRUE, sep=",", as.is = FALSE)
# Preview the data in spreadsheet View
View(cars)

# 2. Exploring the Data
# display the variable names
names(cars)
attributes(cars)
# number of observations and number of variables
dim (cars)
# number of observations
nrow(cars)
dim(cars)[1]
# number of variables
ncol(cars)
length(cars)
dim(cars)[2]
# display the descriptive statistics for all variables
summary (cars)
# display the descriptive statistics for the Make only
summary (cars$Make)
# alternative command to display the descriptive statistics for all variables
lapply(cars, summary)
# display the minimum and maximum value
range(cars$Width)
# display the standard deviation
sd(cars$Width)
# display the mean price
mean(cars$price)
# display the mean price - ignore missing values
mean(cars$price, na.rm=TRUE)

# 3. Variable Filters
# A. Factor function
summary(cars$symboling)
cars$symboling<-factor(cars$symboling)
summary(cars$symboling)

# B. Discretization
# Install arules only once
install.packages("arules")
library (arules)

summary(cars$city_mpg)   # Before
cars$city_mpg<-discretize(cars$city_mpg, method="interval", breaks=6)
summary(cars$city_mpg)     # After

summary(cars$hwy_mpg)      # Before
cars$hwy_mpg<-discretize(cars$hwy_mpg, method="frequency", breaks=6)
summary(cars$hwy_mpg)      # After

summary (cars$Enginesize)  # Before
cars$Enginesize<-discretize(cars$Enginesize, method="cluster", breaks=6)
summary (cars$Enginesize)  # After

summary(cars$Wheelbase)    # Before
cars$Wheelbase<-discretize(cars$Wheelbase, method="fixed", breaks=c(-Inf, 90, 100, 110, Inf))
summary(cars$Wheelbase)    # After

# C. Cut function
summary(cars$Length)   # Before
cars$Length<-cut(cars$Length, 4)
summary(cars$Length)   # After

# D. Deleting a variable
newcars<-cars[, -1]
View(newcars)
# remove more than one variable in a single command
newcars<-cars [, - c(1, 3, 4)]
View(newcars)
newcars<-cars [,  c(1, 2, 3, 4, 5)]
View(newcars)
newcars<-cars[1:5]
View(newcars)
# Remove a column by setting to NULL
newcars<-cars
newcars$Id<-NULL
View(newcars)

# 4. Row filters
# A. Rows Range
newcars<-cars[1:10,]
# B. Handling missing values
# Use a subset command
newcars<-subset(cars, complete.cases(cars))
# Use square brackets
newcars<-cars[complete.cases(cars),]
# Use na.omit
newcars<-na.omit(cars)
# Display the Rows with Missing Values
cars[!complete.cases(cars),]
nrow(cars[!complete.cases(cars),])
# Number of Missing Values in a Data Row
apply(cars, 1, function (cars) sum(is.na(cars)))
# Number of Missing Values for Each Variable
apply(cars, 2, function (cars) sum(is.na(cars)))
# Replacing missing values with the mean
cars$Hp[is.na(cars$Hp)]<-mean(cars$Hp, na.rm=TRUE)
cars$price[is.na(cars$price)]<-mean(cars$price, na.rm=TRUE)
apply(cars, 2, function (cars) sum(is.na(cars)))

# C. Taking a subset
newcars<-subset.data.frame(cars, cars$symboling=="-2")
View(newcars)
newcars<-cars [cars$symboling=="-2", ]
View(newcars)

# D. sorting
cars_sorted<-cars[order(cars$price), ]
head(cars_sorted$price)

# 5. Saving Data to CSV File
write.csv(cars, file="CarsD.csv", row.names=FALSE)
dir()

# 6. Data visualization
# Generic Plot function
plot(table(cars$symboling), type="h", col="dark green")
# Pie Chart
pie(table (cars$Bodystyle))
# Histogram
hist(cars$Hp, col="blue")
# Boxplots
boxplot(cars$Height, col="maroon")
# Step plot
plot(table(cars$Cylinders), type="s", col="dark red")
# Line plot
plot(table(cars$Bodystyle), type="l", col="dark orange")
# Points Plot
plot(table(cars$Bodystyle), type="p", col="dark magenta")
# Lines and Points Plot
plot(table(cars$Bodystyle), type="b", col="cyan")

