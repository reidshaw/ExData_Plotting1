# required packages
library(data.table)
library(lubridate)

# Set the working directory
setwd("/Users/reidshaw/Desktop")

#Load the dataset
data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Use data from only the below-listed dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Plot 1: histogram 

# make sure the plots folder exists
if (!file.exists('plots')) {
     dir.create('plots')
}

png(filename='plots/plot1.png',width=480,height=480,units='px')

hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = 2)

dev.off()
