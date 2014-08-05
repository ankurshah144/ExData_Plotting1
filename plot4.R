## R script to generate a comparison plot for Exploratory Data Analysis
## Course Project 1, Plot 4

library(data.table)

## Set working direcotry
setwd("~/DS Toolbox/Exploratory Data Analysis")
## Read large input file
data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

## Create subset of data to use
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

## Convert columns for use in plotting
datasub$Date <- as.Date(datasub$Date, "%d/%m/%Y")
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub$Global_reactive_power <- as.numeric(datasub$Global_reactive_power)
datasub$Voltage <- as.numeric(datasub$Voltage)
datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)

## Date/Time to use in plotting
x <- strptime(paste(datasub$Date, datasub$Time), "%Y-%m-%d %H:%M:%S")

## Set output
setwd("~/DS Toolbox/Github/ExData_Plotting1")
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')

## begin plotting
par(mfrow=c(2,2), bg = "transparent")
with(datasub, {
    plot(x, Global_active_power, type="l", xlab="", ylab="Global Active Power")  ## topleft
    plot(x, Voltage, type="l", xlab="datetime", ylab="Voltage")  ## topright
    ## bottomleft - start
    plot(x, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")  ## initialize
    points(x, Sub_metering_1, type="l", col="black")
    points(x, Sub_metering_2, type="l", col="red")
    points(x, Sub_metering_3, type="l", col="blue")
    legend("topright", pch=NA, lwd=1, lty=1, bty="n"
                , col=c("black", "red", "blue")
                , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    ## bottomleft - end
    plot(x, Global_reactive_power, type="l", xlab="datetime")  ## bottomright
})

dev.off()
