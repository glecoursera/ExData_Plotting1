library(data.table)
library(dplyr)

#grep may cause issues on Windows
data <- fread(paste("grep ^[12]/2/2007", "./household_power_consumption.txt"), na.strings = c("?", ""))
setnames(data, colnames(fread("./household_power_consumption.txt", nrows=0)))
data[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png(filename="plot3.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(data$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
lines(data$DateTime, as.numeric(data$Sub_metering_1), type="l", col="black") 
lines(data$DateTime, as.numeric(data$Sub_metering_2), type="l", col="red") 
lines(data$DateTime, as.numeric(data$Sub_metering_3), type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()