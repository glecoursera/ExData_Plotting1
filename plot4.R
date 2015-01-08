library(data.table)
library(dplyr)

data <- fread("./household_power_consumption.txt", na.strings = "?", header=TRUE)
data[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
subsetted <- filter(data, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))

png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(subsetted$DateTime, as.numeric(subsetted$Global_active_power), type="n", ylab="Gobal Active Power", xlab="")
lines(subsetted$DateTime, as.numeric(subsetted$Global_active_power), type="l") 

plot(subsetted$DateTime, as.numeric(subsetted$Voltage), type="n", ylab="Voltage", xlab="dateTime")
lines(subsetted$DateTime, as.numeric(subsetted$Voltage), type="l") 


plot(subsetted$DateTime, as.numeric(subsetted$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
lines(subsetted$DateTime, as.numeric(subsetted$Sub_metering_1), type="l", col="black") 
lines(subsetted$DateTime, as.numeric(subsetted$Sub_metering_2), type="l", col="red") 
lines(subsetted$DateTime, as.numeric(subsetted$Sub_metering_3), type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, bty="n", lty=c(1,1), col=c("black", "red", "blue"))


plot(subsetted$DateTime, as.numeric(subsetted$Global_reactive_power), type="n", ylab="Global_reactive_power", xlab="dateTime")
lines(subsetted$DateTime, as.numeric(subsetted$Global_reactive_power), type="l") 
dev.off()
