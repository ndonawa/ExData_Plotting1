##Readfiles
filename <- "file:///C:/Users/T93J09O/Documents/household_power_consumption.txt"
householdpower <- read.table(filename, skip = 1, sep = ";")
## SetColumn Names

names(householdpower) <- c("Date",
                           "Time", 
                           "GLBActive",
                           "GLBREACTIVE",
                           "Voltage",
                           "GLBINTENSITY",
                           "SubMetering",
                           "SubMetering2", 
                           "SubMetering3" )

##SubsetDates
power <- subset(householdpower,householdpower$Date=="1/2/2007" | householdpower$Date =="2/2/2007")

##Format Variables

power$Date <- as.Date(power$Date, format = "%d/%m/%y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power[1:1440, "Time"] <- format(power[1:1440, "Time"], "2007-02-01 %H:%M:%S")
power[1441:2880, "Time"] <- format(power[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

plot(power$Time,as.numeric(as.character(power$SubMetering)),
     type = "l",
     xlab = "",
     ylab = "Energy Sub Metering")
with(power,lines(Time,as.numeric(as.character(power$SubMetering2)), col = "red"))
with(power,lines(Time,as.numeric(as.character(power$SubMetering3)), col = "blue"))
legend("topright", legend=c("Sub-metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col=c("black", "red", "blue"))

