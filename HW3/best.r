#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 5
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

#Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
#outcome name. The function reads the outcome-of-care-measures.csv and returns a character vector
#with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specifed outcome
#in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
#be one of heart attack, heart failure, or pneumonia. Hospitals that do not have data on a particular
#outcome should be excluded from the set of hospitals when deciding the rankings.
best <- function(state, outcome) {
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
    slice <- slice[order(slice[,index], na.last=TRUE),2]
    slice <- na.omit(slice)
    
    #Get hospital name with the lowest 30-day mortality rate.
    slice[1]
}