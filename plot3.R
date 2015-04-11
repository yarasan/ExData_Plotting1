plot3 <- function() {

setwd("Exploratory_Assignment I")

# reading data
qdata <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

# we'll use the date object for subsetting the data
qdata$tempDate <- as.Date(qdata$Date, format="%d/%m/%Y")

# filtering the data according to the specified criteria
ddata <- qdata[qdata$tempDate >= as.Date("2007-02-01") & qdata$tempDate <= as.Date("2007-02-02"),]

# composing a new date field
ddata$cTime <- as.POSIXct(paste(ddata$Date, ddata$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(ddata$cTime, ddata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")

points(ddata$Sub_metering_2 ~ ddata$cTime,type="l",col="red")

points(ddata$Sub_metering_3 ~ ddata$cTime,type="l",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-“)

dev.off()

}


