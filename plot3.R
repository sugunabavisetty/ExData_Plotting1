file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";")
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subset$Global_active_power)
submetering1 <- as.numeric(subset$Sub_metering_1)
submetering2 <- as.numeric(subset$Sub_metering_2)
submetering3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab = "Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

