# Load library
library(tidyverse)

# Download the file from web and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip("data.zip")

# Read data from the text file and filter the two dates
data_init <- read.table("household_power_consumption.txt", 
                        header=TRUE, na.strings="?", sep=";")
data <- filter(data_init, Date =="1/2/2007" | Date=="2/2/2007")

# Format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date_Time <- paste(data$Date, data$Time)
data$Date_Time <- as.POSIXct(date_Time)

# Plot plot 3
with(data, {
        plot(Sub_metering_1~Date_Time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
        lines(Sub_metering_2~Date_Time, col='Red')
        lines(Sub_metering_3~Date_Time, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"), cex=0.8)

# Save the plot in png graphics device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
