library(data.table)
library(dplyr)

#grep may cause issues on Windows
data <- fread(paste("grep ^[12]/2/2007", "./household_power_consumption.txt"), na.strings = c("?", ""))
setnames(data, colnames(fread("./household_power_consumption.txt", nrows=0)))
par(mar=c(5.1,4.1,4.1,5.1))
png(filename="./plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col="red", breaks=11, main="Global Active Power", xlab="Gobal Active Power (kilowatts)", ylab="Frequency")
dev.off()