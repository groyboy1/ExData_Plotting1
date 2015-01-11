# Read the Data
householdPowerConData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Covert columns to Date and Time
householdPowerConData$Time <- as.POSIXct(paste(householdPowerConData$Date, householdPowerConData$Time),format="%d/%m/%Y %H:%M:%S")

householdPowerConData$Date <- as.Date(householdPowerConData$Date,"%d/%m/%Y")

# Date Filter
date1 <- as.Date("01/02/2007", "%d/%m/%Y") 
date2 <- as.Date("02/02/2007", "%d/%m/%Y") 
householdPowerConDataSpecDates <- subset(householdPowerConData, householdPowerConData$Date == date1 | householdPowerConData$Date == date2)

# PLOT ALL

png(filename = "plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# PLOT 1
# Convert Global active power to character
householdPowerConDataSpecDates$Global_active_power <- as.character(householdPowerConDataSpecDates$Global_active_power)
# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Global_active_power != "?",]
# convert to numeric
householdPowerConDataSpecDates$Global_active_power <- as.numeric(householdPowerConDataSpecDates$Global_active_power)
#Plot
with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Global_active_power,
                                          type = "l", xlab = "", ylab = "Global Active Power" ))


# PLOT 2
# Convert Voltage to character
householdPowerConDataSpecDates$Voltage <- as.character(householdPowerConDataSpecDates$Voltage)
# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Voltage != "?",]
# convert to numeric
householdPowerConDataSpecDates$Voltage <- as.numeric(householdPowerConDataSpecDates$Voltage)
#Plot
with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Voltage,
                                          type = "l", xlab = "datetime", ylab = "Voltage" ))


# PLOT 3 
# Convert Sub_metering_1 to character
householdPowerConDataSpecDates$Sub_metering_1 <- as.character(householdPowerConDataSpecDates$Sub_metering_1)
# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Sub_metering_1 != "?",]
# convert to numeric
householdPowerConDataSpecDates$Sub_metering_2 <- as.character(householdPowerConDataSpecDates$Sub_metering_2)
householdPowerConDataSpecDates$Sub_metering_1 <- as.numeric(householdPowerConDataSpecDates$Sub_metering_1)
householdPowerConDataSpecDates$Sub_metering_2 <- as.numeric(householdPowerConDataSpecDates$Sub_metering_2)
# Plot
with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_1,
                                          type = "l", xlab = "", ylab = "Energy sub metering" ))
with(householdPowerConDataSpecDates, lines(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_2, col = "red"))
with(householdPowerConDataSpecDates, lines(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

# PLOT 4
# Convert Global_reactive_power to character
householdPowerConDataSpecDates$Global_reactive_power <- as.character(householdPowerConDataSpecDates$Global_reactive_power)
# remove missing values
householdPowerConDataSpecDates <- householdPowerConDataSpecDates[householdPowerConDataSpecDates$Global_reactive_power != "?",]
# convert to numeric
householdPowerConDataSpecDates$Global_reactive_power <- as.numeric(householdPowerConDataSpecDates$Global_reactive_power)
#Plot
with(householdPowerConDataSpecDates, plot(householdPowerConDataSpecDates$Time, householdPowerConDataSpecDates$Global_reactive_power,
                                          type = "l", xlab = "datetime", ylab = "Global_reactive_power" ))


dev.off()


