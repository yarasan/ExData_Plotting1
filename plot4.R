plot4 <- function() {

setwd("Exploratory_Assignment I")

# reading data
qdata <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

# we'll use the date object for subsetting the data
qdata$tempDate <- as.Date(qdata$Date, format="%d/%m/%Y")

# filtering the data according to the specified criteria
ddata <- qdata[qdata$tempDate >= as.Date("2007-02-01") & qdata$tempDate <= as.Date("2007-02-02"),]

# composing a new date field
ddata$cTime <- as.POSIXct(paste(ddata$Date, ddata$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

par(mfrow=c(2,2))

# adding the first plot
plot(ddata$cTime, ddata$Global_active_power,type="l",ylab="Global Active Power", xlab="")

# adding the second, Voltage versus weekdays plot
plot(ddata$cTime, ddata$Voltage,type="l",ylab="Voltage", xlab="datetime")

# adding the third plot, with 3 value series for Y axis
plot(ddata$cTime, ddata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")

points(ddata$Sub_metering_2 ~ ddata$cTime,type="l",col="red")

points(ddata$Sub_metering_3 ~ ddata$cTime,type="l",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-")

# adding the fourth plot
plot(ddata$cTime, ddata$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
 
dev.off()

}


