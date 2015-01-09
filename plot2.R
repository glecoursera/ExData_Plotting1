library(data.table)
library(dplyr)

#grep may cause issues on Windows
data <- fread(paste("grep ^[12]/2/2007", "./household_power_consumption.txt"), na.strings = c("?", ""))
setnames(data, colnames(fread("./household_power_consumption.txt", nrows=0)))
data[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png(filename="plot2.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(data$Global_active_power), type="n", ylab="Gobal Active Power (kilowatts)", xlab="")
lines(data$DateTime, as.numeric(data$Global_active_power), type="l") 
dev.off()