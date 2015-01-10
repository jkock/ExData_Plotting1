#set WorkDirectory first

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses = c("character", "character", rep("numeric", 5)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main="Global Active Power")

dev.copy(png, file="plot1.png")

dev.off()
