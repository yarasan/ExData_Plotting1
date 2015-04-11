plot1 <- function() {

setwd("Exploratory_Assignment I")

# reading data
qdata <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

# we'll use the date object for subsetting the data
qdata$tempDate <- as.Date(qdata$Date, format="%d/%m/%Y")

# filtering the data according to the specified criteria
ddata <- qdata[qdata$tempDate >= as.Date("2007-02-01") & qdata$tempDate <= as.Date("2007-02-02"),]

# composing a new date field
ddata$cTime <- as.POSIXct(paste(ddata$Date, ddata$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot1.png")

hist(ddata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=12)

dev.off()

}


