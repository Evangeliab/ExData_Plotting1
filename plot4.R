library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column & specifying its class                                
Sys.setlocale(category = "LC_TIME", locale = "C")

png(file = "plot4.png", width=480, height=480) ## opens PNG device; creates this file in the working directory

par(mfrow = c(2, 2)) ## adjusts for multiple plots to appear

with(data,{
     plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="") # top-left plot
     plot(datetime, Voltage, type="l")    # top-right plot
     plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")  #bottom-left plot
     lines(data$datetime, data$Sub_metering_2, col="red")
     lines(data$datetime, data$Sub_metering_3, col="blue")
     legend("topright", lty = 1, lwd=1, col=c("black","red","blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty='n', cex=0.95)
     plot(datetime, Global_reactive_power,type="l")     # bottom-right plot
})

dev.off() ## closes the PNG device