library(data.table)

data<-fread("household_power_consumption.txt", sep=";", na.strings=c("?",""))
data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

library(lubridate)
data$datetime <- dmy_hms(paste(data$Date, data$Time)) ## creates a new column combining Date and Time column                  
Sys.setlocale(category = "LC_TIME", locale = "C") ## sets the locale to English 

## creates a scatterplot which its values presented with a line, xy-axis are specified
with(data, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="",cex.axis=0.7,cex.lab=0.8))

dev.copy(png, file = "plot2.png", width=480, height=480) ## Copies the plot to a PNG file
dev.off() ## closes the PNG device
