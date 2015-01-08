library(data.table)
library(dplyr)

data <- fread("./household_power_consumption.txt", na.strings = "?", header=TRUE)
data[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
subsetted <- filter(data, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
png(filename="plot2.png", width = 480, height = 480)
plot(subsetted$DateTime, as.numeric(subsetted$Global_active_power), type="n", ylab="Gobal Active Power (kilowatts)", xlab="")
lines(subsetted$DateTime, as.numeric(subsetted$Global_active_power), type="l") 
dev.off()