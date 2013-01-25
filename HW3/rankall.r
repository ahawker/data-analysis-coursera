#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 7
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

rankall <- function(outcome, num="best") {
    #Invalid outcome input type
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    }
    
    #Get index for our given outcome string.
    index <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
    
    #Read and coerce our dataset while suppressing warnings and removing NA's.
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    data[,index] <- suppressWarnings(as.numeric(data[,index]))
    data <- data[!is.na(data[,index]),]
    
    #Sort our data by specified mortality rate and hospital name
    data.sorted <- data[order(data[,index], data[,2], na.last=TRUE),]
    data.sorted <- data.sorted[!is.na(data.sorted[,index]),]
    
    #Parse out and validate our num
    num <- ifelse(num == "best", 1, ifelse(num == "worst", length(data.sorted), as.numeric(num)))
    
    #Remove duplicate state names
    states <- sort(unique(data.sorted[,7]))
    
    #Function returns the hospital name for the given state at the specified rank.
    state_hospital_data <- function(state) {
        slice <- subset(data.sorted, State==state)
        slice <- slice[num, c(2,7,index)]
        slice$State <- state
        return (slice)
    }
    state_data <- lapply(states, state_hospital_data)
    dframe <- as.data.frame(do.call(rbind, lapply(states, state_hospital_data)), row.names=states)
    colnames(dframe) <- c("hospital", "state")
    return (dframe)
}