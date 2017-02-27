## Title: R for Absolute Beginners workshop
## Author: Nushrat Khan
## Date: 12/05/2016

## Hands-on Activity 1
# Find the current working directory
getwd()

# Set working directory
setwd("/Users/njkhan/Documents/R_Workshop")

# Variable and basic calculation 
i <- 10
j <- 20
i*j - (i + j)

# Function 
firstFunction <- function(n){n*n}
firstFunction(i)

# Vector
x <- c(7, 1, 5, 3)

# Try this functions for vector x
sum(x)
length(x)
mean(x)
sort(x)

## Creating a dataframe
# Create vectors
name <- c("apple", "banana", "peach", "watermelon", "grape")
color <- c("red", "yellow", "peach", "green", "red")
size_cm <- c(10, 15, 8, 40, 2)

# Add the vectors together for fruits.data 
fruits.data <- data.frame(name, color, size_cm)

# See the values of fruits.data
fruits.data

# Add new variable to the data frame
fruits.data["quantity"] <- c(2, 6, 5, 1, 30)

# Select a subset of fruits.data
my_fruits <- subset(fruits.data, quantity < 5, select = c(name, quantity))

## Hands-on Activity 2

## Install packages
# Hmisc
install.packages("Hmisc")
library(Hmisc)

# plyr
install.packages("plyr")
library(plyr)

# dplyr
install.packages("dplyr")
library(dplyr)

# install ggplot2 package
install.packages("ggplot2")
library(ggplot2)

# Look into the content of airquality and mtcars dataset
airquality
mtcars

# Example of how to load datasets but not necessary for this exercise.
# Load datasets
aq <- read.csv("airquality.csv")

# The airquality dataset adds an extra column when loaded. 
# Remove the extra column by setting it's value to NULL.
aq$X <- NULL

# Try these examples with the airquality dataset or the loaded dataset aq

# Returns first 10 rows of the data frame
head(aq, n = 10) 

# Returns an overall summary of the data frame for each columns 
summary(aq)

# Returns the mean for that specific column
mean(aq$Temp)

# Applies "mean" function over the columns
sapply(aq, mean, na.rm = TRUE)

# Returns statistical observations of the data frame (Hmisc package function)
describe(aq)

# Select a subset based on given conditions
warmDays <- subset(aq, Temp > 80, select = c(Day, Month, Temp))
warmDays

# Reorders columns (function from Dplyr package)
arrange(warmDays, Temp)

# Count the days in a month for each temperature
count(warmDays, c("Temp", "Month"))

# Find the average temperature for each month
aggregate(Temp ~ Month, data = aq, mean)

## Plotting (using mtcars dataset)

# Split the screen into two
par(mfrow = c(1, 2))

## Scatter Plot
# Find out the relationship between car weight and mile per gallon (mpg) use.
plot(mtcars$wt, mtcars$mpg, main="Scatterplot Example", xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)

# Add fit lines
abline(lm(mtcars$mpg~mtcars$wt), col="red")  # regression line (y~x)
lines(lowess(mtcars$mpg~mtcars$wt), col="green")   # lowess line (x, y)

# Create the same graph using ggplot2
qplot(mtcars$wt, mtcars$mpg, xlab = "Car Weight", ylab = "Mile/Gallon")

# Following syntax can be used if the two vectors are already in the same data frame.
qplot(wt, mpg, data=mtcars, xlab = "Car Weight", ylab = "Mile/Gallon")


## Histogram - view the distribution of one dimensional data
hist(mtcars$mpg)

# Specify approximate number of bins with breaks
hist(mtcars$mpg, breaks = 10)

# Use ggplot2
qplot(mtcars$mpg)
qplot(Temp, data = airquality, binwidth = 2)

## Boxplot of MPG by Car Cylinders 
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

## Bar plot
barplot(mtcars$wt)

# Generate a table of counts
barplot(table(mtcars$cyl))

# Using ggplot2
qplot(mtcars$cyl)

# Treat cyl as discrete
qplot(factor(mtcars$cyl))

