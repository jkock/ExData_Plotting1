#set WorkDirectory first

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses = c("character", "character", rep("numeric", 5)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

data$DateTime <- strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2), cex.lab = 0.75)

plot(data$DateTime, data$Global_active_power, type="l" , main="", xlab = "", ylab="Global Active Power")

plot(data$DateTime, data$Voltage, type="l" , main="", xlab = "datetime", ylab="Voltage")

plot(data$DateTime, data$Sub_metering_1, type="l" , main="", xlab = "", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright", bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, lty=c(1,1,1), cex=0.5)

plot(data$DateTime, data$Global_reactive_power, type="l" , main="", xlab = "datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()
