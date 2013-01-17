#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #1
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=14

#Read in the dataset
data <- read.csv("hw1_data.csv")

#What are the dataset column names?
colnames(data)

#Extract the first two rows of the dataset and print them.
data[1:2,]

#How many rows are in the dataset?
nrow(data)

#Extract the last two rows of the dataset and print them.
rows <- nrow(data)
data[(rows-1):rows,]

#What is the Ozone value in the 47th row?
data[47,1]

#How many missing values are in the Ozone column?
sum(!complete.cases(data[,1]))

#What is the mean value of the Ozone column (excluding missing values)?
mean(data[complete.cases(data),1])

#What is mean Solar.R value of subset with Ozone > 31 and Temp > 90?
mean(subset(data, Ozone>31 & Temp > 90)[,2])

#What is the data type of the Month column?
class(data[,5])

#What is the mean of Temp when Month is 6?
mean(subset(data, data[,5]==6)[,4])