#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #4 - Part 2
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=18

agecount <- function(age=NULL) {
    #Validate age input.
    if (is.null(age)) {
        stop("invalid age")
    }
    
    #Read in our homicide data
    homicides <- readLines("homicides.txt")
    
    #Return # of matches for the given age.
    expr <- paste(".*", age, "years old")
    return(length(grep(expr, homicides, ignore.case=TRUE)))
    
}