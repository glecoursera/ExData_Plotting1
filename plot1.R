library(data.table)
library(dplyr)

data <- fread("./household_power_consumption.txt", na.strings = c("?", " ", ""), header=TRUE)
data[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
subsetted <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
par(mar=c(5.1,4.1,4.1,5.1))
png(filename="./plot1.png", width = 480, height = 480)
hist(as.numeric(subsetted$Global_active_power), col="red", breaks=11, main="Global Active Power", xlab="Gobal Active Power (kilowatts)", ylab="Frequency")
dev.off()