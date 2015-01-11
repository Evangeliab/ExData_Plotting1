library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## creates a histogram specifying its color, x-axis and main title & size
hist(as.numeric(data$Global_active_power), col="red", xlab ="Global Active Power (kilowatts)", main="Global Active Power",cex.axis=0.7,cex.lab=0.8)

dev.copy(png, file = "plot1.png", width=480, height=480) ## Copies the plot to a PNG file
dev.off() ## closes the PNG device