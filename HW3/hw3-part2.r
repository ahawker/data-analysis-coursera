#Andrew Hawker
#Computing for Data Analysis (Winter 2013)
#Assignment #3 - Part 2
#https://class.coursera.org/compdata-002/assignment/view?assignment_id=4

#Read outcome data and coerce.
data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
data[,11] <- as.numeric(data[,11])
data[,17] <- as.numeric(data[,17])
data[,23] <- as.numeric(data[,23])

#Histograms on the same plot window (3 rows, 1 column).
par(mfrow=c(3,1))

#Set x-axis range for all histograms.
xlim <- range(data[,11], data[,17], data[,23], na.rm=TRUE)

#Function returns histogram title and calculated mean death rate for that data outcome index.
main <- function(txt, outcome) {
    return (substitute(paste(txt, " (", bar(x), "=", m, ")"), list(m=round(mean(data[,outcome], na.rm=TRUE), 2), txt=txt)))
}

#Function plots a histogram with the main title, outcome index and x-axis label.
hplot <- function(main_title, outcome, xlab="30-day Death Rate") {
    hist(data[,outcome], xlim=xlim, xlab=xlab, main=main(main_title, outcome))
    abline(v=median(data[,outcome], na.rm=TRUE), lwd=3)
}

#Plot all histograms.
hplot("Heart Attack", 11)
hplot("Heart Failure", 17)
hplot("Pneumonia", 23)