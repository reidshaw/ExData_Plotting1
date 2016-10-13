# required packages
library(data.table)
library(lubridate)

# Set the working directory
setwd("/Users/reidshaw/Desktop")

#Load the dataset
data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Use data from only the below-listed dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Plot 2:
if (!file.exists('plots')) {
     dir.create('plots')
}

# Add variable called DateTime that compresses the "dmy" and "hms" into one value
data$DateTime <- dmy(data$Date) + hms(data$Time)

png(filename='plots/plot2.png',width=480,height=480,units='px')

plot(data$DateTime, 
     data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "", 
     type = "l")

dev.off()

