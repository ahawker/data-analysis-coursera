#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 3
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

#Read outcome data and coerce.
data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
data[,11] <- as.numeric(data[,11])

#Number of observations by state.
table(data[,11])

#Subset of data only considering states which contain twenty or more hospitals.
slice <- subset(data, State >= 20)

#Get slice data for death rates by state.
deaths <- slice[,11]
states <- slice$State

#Get states by death rate ordered by their median.
states_median <- with(slice, reorder(states, deaths, median, na.rm=TRUE))

#Set plot labels to be perpendicular to the axis.
par(las=2)

#Boxplot label values.
main_title <- "Heart Attack 30-day Death Rate by State"
y_label <- "30-day Death Rate"

#Boxplot of deaths rates by state.
boxplot(deaths ~ states, ylab=y_label, main=main_title)

#Boxplot median ordered death rates by state.
boxplot(deaths ~ states_median, data=states_median, ylab=y_label, main=main_title)