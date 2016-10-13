# required packages
library(data.table)
library(lubridate)

# Set the working directory
setwd("/Users/reidshaw/Desktop")

#Load the dataset
data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Use data from only the below-listed dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Add variable called DateTime that compresses the "dmy" and "hms" into one value
data$DateTime <- dmy(data$Date) + hms(data$Time)


# Plot4:
if (!file.exists('plots')) {
     dir.create('plots')
}

# Plots fill column first
par(mfcol = c(2,2))

png(filename='plots/plot4.png',width=480,height=480,units='px')

# Top left plot
plot(data$DateTime, 
     data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "", 
     type = "l")

# Bottom left plot
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1),
       bty = "n")

# Top right plot
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Bottom right plot
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()

