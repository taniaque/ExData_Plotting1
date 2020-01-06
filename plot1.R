# Load library
library(tidyverse)

# Download the file from web and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip("data.zip")

# Read data from the text file and filter the two dates
data_init <- read.table("household_power_consumption.txt", 
                        header=TRUE, na.strings="?", sep=";")
data <- filter(data_init, Date =="1/2/2007" | Date=="2/2/2007")

# Plot the Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="Red", cex.sub=0.8)

# Save the plot in png graphics device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
