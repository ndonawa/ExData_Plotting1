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

#Plot & Annotate

hist(as.numeric(as.character(power$GLBActive)), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
title(main = "Global Active Power")