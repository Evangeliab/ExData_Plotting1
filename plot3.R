library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column, as their class change.                                  
Sys.setlocale(category = "LC_TIME", locale = "C") ## sets the locale to English 

## creates a scatterplot with a line having in y-axis the sub_metering_1 variable
with(data, plot(datetime, Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",cex.axis=0.7,cex.lab=0.8)) 

## adds to the scatterplot a line corresponding to sub_metering_2 or sub_metering_3 variable in y-axis
lines(data$datetime,data$Sub_metering_2,xlab="",col="red")  
lines(data$datetime,data$Sub_metering_3,xlab="",col="blue")

## adds legend and adjusts its box
legend("topright", lty = 1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, y.intersp =0.5)

dev.copy(png, file = "plot3.png", width=480, height=480) ## Copies the plot to a PNG file
dev.off() ## closes the PNG device
