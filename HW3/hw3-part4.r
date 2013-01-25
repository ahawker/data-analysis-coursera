#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 4
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

#Read outcome data.
outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
hospital <- read.csv("hospital-data.csv", colClasses="character")

#Merge outcome and hospital datasets by provider number.
merged <- merge(outcome, hospital, by="Provider.Number")

#Coerce merged data.
deaths <- as.numeric(merged[,11])
patients <- as.numeric(merged[,15])
owners <- factor(merged$Hospital.Ownership)

#Reference lattice for xyplot.
library(lattice)

#Plot variables
x_label <- "Number of Patients Seen"
y_label <- "30-day Death Rate"
main_title <- "Heart Attack 30-day Death Rate by Ownership"

#XYPlot for relationship between death rate and number of patients seen with linear regression line.
xyplot(deaths ~ patients | owners, 
    allow.multiple=TRUE, 
    xlab=x_label, 
    ylab=y_label, 
    main=main_title,
    type=c("p", "r"))