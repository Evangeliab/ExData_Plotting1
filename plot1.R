library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

png(file = "plot1.png", width=480, height=480) ## opens PNG device; creates this file in the working directory

## creates a histogram specifying its color, x-axis and main title
hist(as.numeric(data$Global_active_power), col="red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")

dev.off() ## closes the PNG device