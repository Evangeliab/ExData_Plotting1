library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column & specifying its class                                  
Sys.setlocale(category = "LC_TIME", locale = "C") ## sets the locale to English 

png(file = "plot3.png", width=480, height=480) ## opens PNG device; creates this file in the working directory

## creates a scatterplot with a line having the sub_metering_1 variable in y-axis
with(data, plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")) 

## adds to the scatterplot a line corresponding to sub_metering_2 or sub_metering_3 variable in y-axis
lines(data$datetime, data$Sub_metering_2, col="red")  
lines(data$datetime, data$Sub_metering_3, col="blue")

legend("topright", lty = 1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() ## closes the PNG device
