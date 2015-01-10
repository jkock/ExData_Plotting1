#set WorkDirectory first

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses = c("character", "character", rep("numeric", 5)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

data$DateTime <- strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime, data$Global_active_power, type="l" , main="", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")

dev.off()
