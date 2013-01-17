#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #2 - Part 1
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=2

#Write a function named 'getmonitor' that takes three arguments: 'id', 'directory', and 'summarize'. 
#Given a monitor ID number, 'getmonitor' reads that monitor's particulate matter data from the directory specified 
#in the 'directory' argument and returns a data frame containing that monitor's data. 
#If 'summarize = TRUE', then 'getmonitor' produces a summary of the data frame with the 'summary' function and prints it to the console.
getmonitor <- function(id, directory, summarize=FALSE) {
    ## 'id' is a vector of length 1 indicating the monitor ID
    ## number. The user can specify 'id' as either an integer, a
    ## character, or a numeric.

    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'summarize' is a logical indicating whether a summary of
    ## the data should be printed to the console; the default is
    ## FALSE
    
    path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
    data <- read.csv(path)
    if (summarize)
        summary(data)
    return (data)
}