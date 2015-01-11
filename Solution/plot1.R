# Read the Data
householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Covert columns to Date and Time
householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")

householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

# Date Filter
date1 <- as.Date("01/02/2007", "%d/%m/%Y") 
date2 <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == date1 | householdPowerConData$Date == date2)

# Global Active Power - Spec dates - convert to char
gapSpecDates <- as.character(householdPowerConDataSpecDates$Global_active_power)

# remove missing values
gapSpecDates <- gapSpecDates[gapSpecDates != "?"]

# convert to numeric
gapSpecDatesNum <- as.numeric(gapSpecDates)

# Plot to png
png(filename = "plot1.png",  width = 480, height = 480, units = "px")

hist(gapSpecDatesNum, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

