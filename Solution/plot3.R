# Read the Data
householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Covert columns to Date and Time
householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")

householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

# Date Filter
date1 <- as.Date("01/02/2007", "%d/%m/%Y") 
date2 <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == date1 | householdPowerConData$Date == date2)

# Convert Sub_metering_1 to character
householdPowerConDataSpecDates$Sub_metering_1 <- as.character(householdPowerConDataSpecDates$Sub_metering_1)

# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Sub_metering_1 != "?",]

# convert to numeric
householdPowerConDataSpecDates$Sub_metering_2 <- as.character(householdPowerConDataSpecDates$Sub_metering_2)
householdPowerConDataSpecDates$Sub_metering_1 <- as.numeric(householdPowerConDataSpecDates$Sub_metering_1)
householdPowerConDataSpecDates$Sub_metering_2 <- as.numeric(householdPowerConDataSpecDates$Sub_metering_2)

# Plot to png
png(filename = "plot3.png",  width = 480, height = 480, units = "px")

with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_1,
                                          type = "l", xlab = "", ylab = "Energy sub metering" ))

with(householdPowerConDataSpecDates, lines(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_2, col = "red"))
with(householdPowerConDataSpecDates, lines(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()

