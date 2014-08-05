## R script to generate a comparison plot for Exploratory Data Analysis
## Course Project 1, Plot 3

library(data.table)

## Set working direcotry
setwd("~/DS Toolbox/Exploratory Data Analysis")
## Read large input file
data <- fread("household_power_consumption.txt", sep=";", na.strings="?"
                , sel=c("Date", "Time", "Sub_metering_1"
                            , "Sub_metering_2", "Sub_metering_3"))

## Create subset of data to use
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

## Convert columns for use in plotting
datasub$Date <- as.Date(datasub$Date, "%d/%m/%Y")
datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)

## Date/Time to use in plotting
x <- strptime(paste(datasub$Date, datasub$Time), "%Y-%m-%d %H:%M:%S")

##Set output
setwd("~/DS Toolbox/Github/ExData_Plotting1")
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

## Create plot to match course project requirements
with(datasub, plot(x, Sub_metering_1, type="n"
                    , xlab="", ylab="Energy sub metering"))  ## initialize
with(subset(datasub), points(x, Sub_metering_1, type="l", col="black"))
with(subset(datasub), points(x, Sub_metering_2, type="l", col="red"))
with(subset(datasub), points(x, Sub_metering_3, type="l", col="blue"))
## set legend; took lots of trial & errors and Stack Overflow reads!
legend("topright", pch=NA, lwd=1, lty=1
        , col=c("black", "red", "blue")
        , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
