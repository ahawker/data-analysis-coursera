#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 1
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

#Read outcome data and plot as histogram.
#Add histogram x-axis label that says "30-day Death Rate"
#Add histogram title that says "Heart Attack 30-day Death Rate"

data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
data[,11] <- as.numeric(data[,11])
hist(data[,11], main="Heart Attack 30-day Death Rate", xlab="30-day Death Rate")