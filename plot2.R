## R script to plot a line graph for Exploratory Data Analysis
## Course Project 1, Plot 2

library(data.table)

## Set working direcotry
setwd("~/DS Toolbox/Exploratory Data Analysis")
## Read large input file
data <- fread("household_power_consumption.txt", sep=";", na.strings="?"
                , sel=c("Date", "Time", "Global_active_power"))

## Create subset of data to use
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

## Convert columns for use in plotting
datasub$Date <- as.Date(datasub$Date, "%d/%m/%Y")
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

## Set output
setwd("~/DS Toolbox/Github/ExData_Plotting1")
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

## Create plot to match course project requirements
with(datasub
        , plot(strptime(paste(datasub$Date, datasub$Time), "%Y-%m-%d %H:%M:%S")
        , Global_active_power, type="l"
        , xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
