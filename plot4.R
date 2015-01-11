library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column, as their class change.                                  
Sys.setlocale(category = "LC_TIME", locale = "C")

par(mfrow = c(2, 2),cex.axis=0.7,cex.lab=0.8) ## adjusts for multiple plots to appear

with(data,{
     plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
     plot(datetime,Voltage,type="l")
})

with(data, plot(datetime, Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
lines(data$datetime,data$Sub_metering_2,xlab="",col="red")
lines(data$datetime,data$Sub_metering_3,xlab="",col="blue")
legend("topright", lty = 1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,y.intersp=0.2,bty='n')

with(data,plot(datetime, Global_reactive_power,type="l"))

dev.copy(png, file = "plot4.png", width=480, height=480) ## Copies the plot to a PNG file
dev.off() ## closes the PNG device