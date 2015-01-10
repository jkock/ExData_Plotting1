#set WorkDirectory first

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses = c("character", "character", rep("numeric", 5)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

data$DateTime <- strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime, data$Sub_metering_1, type="l" , main="", xlab = "", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, lty=c(1,1,1))

dev.copy(png, file="plot3.png")

dev.off()
