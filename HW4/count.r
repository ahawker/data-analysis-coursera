#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #4 - Part 1
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=18

count <- function(cause=NULL) {
    #Validate our 'cause of death' input.
    cods <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
    if (!cause %in% cods) {
        stop("invalid cause of death")
    }
    
    #Read in our homicide data
    homicides <- readLines("homicides.txt")
    
    #Return # of matches for the given cause.
    expr <- paste("cause:", cause)
    return(length(grep(expr, homicides, ignore.case=TRUE)))
}