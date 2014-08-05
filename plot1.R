## R script to plot a histogram for Exploratory Data Analysis
## Course Project 1, Plot 1

library(data.table)

## Set working direcotry
setwd("~/DS Toolbox/Exploratory Data Analysis")
## Read only the required columns from large input file
data <- fread("household_power_consumption.txt", sep=";"
                , na.strings="?", select=c("Date", "Global_active_power"))

## Create subset of data to use
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

## Convert columns for use in plotting
datasub$Date <- as.Date(datasub$Date, "%d/%m/%Y")
## fread didn't convert "?" to NA even though I used na.strings
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

##Set output
setwd("~/DS Toolbox/Github/ExData_Plotting1")
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

## Create histogram to match course project requirements
hist(datasub$Global_active_power, col="red"
        , main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
