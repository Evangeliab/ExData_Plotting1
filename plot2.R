library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column & specifying its class                 
Sys.setlocale(category = "LC_TIME", locale = "C") ## sets the locale to English 

png(file = "plot2.png", width=480, height=480) ## opens PNG device; creates this file in the working directory

## creates a scatterplot which its values presented with a line, xy-axis are specified
with(data, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off() ## closes the PNG device
