## R script to plot a histogram for Exploratory Data Analysis
## Course Project 1, Plot 1

## Set working direcotry
setwd("~/DS Toolbox/Exploratory Data Analysis")
## Read large input file
data <- fread("household_power_consumption.txt", sep=";", na.strings="?"
                , colClasses=c("list", "character", "numeric", "numeric"
                                , "numeric", "numeric", "numeric", "numeric"
                                , "numeric"))

## Create subset of data to use
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

## Convert columns for use in plotting
datasub$Date <- as.Date(datasub$Date, "%d/%m/%Y")
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub$Global_reactive_power <- as.numeric(datasub$Global_reactive_power)
datasub$Voltage <- as.numeric(datasub$Voltage)
datasub$Global_intensity <- as.numeric(datasub$Global_intensity)
datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)

## Create histogram to match course project requirements
hist(datasub$Global_active_power, col="red"
        , main="Global Active Power", xlab="Global Active Power (kilowatts)")
setwd("~/DS Toolbox/Github/ExData_Plotting1")
## Copy to .png file
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()
