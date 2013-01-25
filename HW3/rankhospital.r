#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 6
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

rankhospital <- function(state, outcome, num="best") {
    #Invalid outcome input type
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    }
    
    #Get index for our given outcome string.
    index <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
    
    #Read and coerce our dataset while suppressing warnings and removing NA's.
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    data[,index] <- suppressWarnings(as.numeric(data[,index]))
    data <- na.omit(data)
    
    #Invalid state input or no observations
    states <- table(data$State)
    if (!state %in% names(states)) { 
        stop("invalid state")
    }
    
    #Slice our data by the given state and sort it by outcome and hospital name.
    slice <- subset(data, State==state)
    slice <- slice[order(slice[,index], slice[,2], na.last=TRUE),2] #this is ordered by rate
    slice <- na.omit(slice)
    
    num <- ifelse(num == "best", 1, ifelse(num == "worst", length(slice), as.numeric(num)))
    
    #Get hospital name for the given rank by its 30-day mortality rate.
    slice[num]
}