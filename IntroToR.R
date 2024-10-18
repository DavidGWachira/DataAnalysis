# Printing 
print ('hello world')
print ("I love learning R")

# Create a variable (storage location)
myName <- "First, Last" 
print(myName) 
myName 
#Q: Create a character variable for the month you were born
charMonth <- "April"
#Q: Create a numeric variable for the month you were born
numMonth <- 04

# Vectors
# Vectors - 1-D array of values (numeric or character) of the same type.
# A list of values, column of values

consInt <- 1:10 # Consecutive integers
arbSeq <- seq(1, 10, 2) # Arbitrary sequences
repNum <- rep(2, 5) # Replicating numbers
combElem <- c(40, 5, 12) # Combine elements
randomNumbers <- rnorm(5) # Generate Gaussian random Numbers
#sample(1:100, 5, replace = TRUE)

#Q: Write a code that will only list odd numbers between 10 and 50
odd <- seq(11, 50, 2)
#Q: Write a code that will repeat 8 fifty times
eightFifty <- rep(8, 50)

# Data Types
# An important feature of a vector is that all the elements are of the same type
typeof(consInt)
typeof(randomNumbers)
#Q: Check the data type of myName variable
typeof(myName)

# Matrix
# Matrix - 2-D array of values. A table with m rows and n columns
# A dataset
A <- matrix(1:4)
A
B <- matrix(1:15, ncol = 3)
B

dim(B) # Dimension/Shape
nrow(B) # Number of rows
ncol(B) # Number of columns
#Q: Create a matrix called C that has numbers 1-20 and is organized into 4 rows
C <- matrix(1:20, nrow = 4)
#Q: Check the dimensions of the matrix you just created
dim(C)
                                                                                                                               
# Functions
# We have been using pre-made/existing functions. print(), typeof(), dim()
# Now let us create our functions

addOne <- function(myInput)
{
  myOutput <- myInput + 1
  return(myOutput)
}
addOne(41)
#Q: Create a function that multiplies your input by 5
multiplyFive <- function(myInput)
{
  myOutput <- myInput * 5
  return(myOutput)
}
multiplyFive(10)

# Working with a data set

# 1. Set the working directory
setwd("C:/Users/david.wachira/OneDrive - The University of South Dakota/Documents/David/JOB/Workshops/Data Science/R")
dir()

# 2. Import/Read the data set
Automobile <- read.csv("Automobile.csv") 
head(Automobile, 3)
#Q: Use tail() function to write a code that shows the last 3 records in the Automobile data set
tail(Automobile, 3)

# 3. Data Exploration
#Q: What is the data type of the data set?
typeof(Automobile)
#Q: What is the dimension/shape of the database?
dim(Automobile)
#Q: Write a code to output the no of rows in the dataset
nrow(Automobile)
#Q: Write a code to output the number of columns in the dataset
ncol(Automobile)

# What is the data type of the variable "name"
typeof(Automobile$name) #$ directly accesses specific columns or elements by their names within a data frame
# Check the variables in the dataset
colnames(Automobile)

#Descriptive statistics - Numerical variables
summary(Automobile)
summary(Automobile$displacement)
#Frequency Tables - Categorical variables
table(Automobile$origin) 

#Q: Write a code that will generate a frequency table for the model_year column
table(Automobile$model_year)
#Q: How many cars were made each year in each country in each year?
table(Automobile$origin, Automobile$model_year)

# 4. Data Cleaning
# Missing Values
is.na(Automobile)
sum(is.na(Automobile))
# Sapply - apply a function to each element of a list, vector, and simplify the output
sapply(Automobile, function(x) sum(is.na(x))) 

# Make a copy of the Automobile data set
Automobile2 <- Automobile 

# Drop Missing Values
# Install and Load necessary library. 
# A library is a collection of pre-written codes that you can use to perform specific tasks 
#install.packages("tidyr")
library(tidyr) # tidyr - tidy your data, drop_na, 
# library(dplyr) # For data manipulation. select(), filter(), mutate()
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
Automobile2 <- Automobile2 %>% drop_na(horsepower)
# %>% is called pipe operator. 
# takes the output of the expression on its left and passes it as the first argument to the function on its right.
# Piping is done to enhance the readability and clarity of the code, making complex data transformations easier to understand and manage.
# "Automobile2" is passed to "drop_na(horsepower)" resulting in a data frame without NULLS
#Q: Using sapply() function, check if the Automobile2 has any missing values
sapply(Automobile2, function(x) sum(is.na(x)))
#Q: Check the dimensions of Automobile2. What does the output mean
dim(Automobile2)

mean(Automobile2$horsepower, na.rm=TRUE)

# 5. Exporting/Saving data set
#write.csv(Automobile2, "Automobile2_Export.csv", row.names = FALSE)

# 6. Creating Plots/Graphs
# a.) Base R plotting - plot(), hist(), boxplot()
hist(Automobile2$displacement,
     xlab = "displacement",
     main = "Vehicle Displacement Distribution")
# Q: What is the weight's distribution
hist(Automobile2$weight,
     xlab = "displacement",
     main = "Vehicle Weight Distribution")

# b.) Third-party package ggplot2
# Install necessary library
library(ggplot2) # For plots
ggplot(Automobile2, aes(x = weight, y = horsepower)) +
  geom_point() +
  ggtitle("Relationship between Weight and Horsepower") 
# Q: What is the relationship between "horsepower" and "acceleration"
ggplot(Automobile2, aes(x = horsepower, y = acceleration)) +
  geom_point() +
  ggtitle("Relationship between Weight and Horsepower") 

#-----------------------ASSESSMENT QUESTIONS------------------------------------
#Q. Which of the following is a variable name in R?
#A) '2nd_variable', B) 'variable_name', C) '_variablename'

#Q. What function is used to read the dataset in R?
#A) read.csv, B) read.dataset, C) import.csv

#Q. What function provides the first few rows of a dataset?
#A) first(), B) head(), C) preview()

#Q. How can you check the data type of the dataset in R? 
#A) typeof(), B) type(), C)datatype()

#Q. What function gives the dimension (number of rows and columns) in a dataset in R?
#A) size(), B) dim(), C) shape()

#Q. How can you check the column names of a dataset in R? 
#A) colnames(), B) columns(), C) header()

#Q. What does table() function do in R?
#A) Summarizes numerical data, B) Creates frequency table, C) Display first few rows

#Q. What does drop_na() function do in R?
#A) fills missing value, B) removes rows with missing values, C) identifies missing values

#Q. What does is.na() function do in R?
#A) fills missing value, B) removes rows with missing values, C) identifies rows with missing values

#Q. How do you create a histogram in base R?
#A) hist(), B) plot(), C) histogram()


