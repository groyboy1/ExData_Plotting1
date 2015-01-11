# Read the Data
householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Covert columns to Date and Time
householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")

householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

# Date Filter
date1 <- as.Date("01/02/2007", "%d/%m/%Y") 
date2 <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == date1 | householdPowerConData$Date == date2)

# Convert Global active power to character
householdPowerConDataSpecDates$Global_active_power <- as.character(householdPowerConDataSpecDates$Global_active_power)

# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Global_active_power != "?",]

# convert to numeric
householdPowerConDataSpecDates$Global_active_power <- as.numeric(householdPowerConDataSpecDates$Global_active_power)

# Plot to png
png(filename = "plot2.png",  width = 480, height = 480, units = "px")

with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Global_active_power,
                                          type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ))

dev.off()

