#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #2 - Part 2
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=2

#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of the file 
#and the second column is the number of complete cases.
complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    nobs <- function(id) {
        path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
        return (sum(complete.cases(read.csv(path))))
    }
    return (data.frame(id=id, nobs=sapply(id, nobs)))
}