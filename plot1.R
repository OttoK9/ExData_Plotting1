dataAll <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSub <- rbind(subset(dataAll, dataAll$Date == "1/2/2007"), subset(dataAll, dataAll$Date == "2/2/2007"))
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)

dataSub$Date <- as.Date(dataSub$Date, format = "%d/%m/%Y")
#dataSub$Time <- strptime(dataSub$Time)

png(file = "plot1.png")
hist(dataSub$Global_active_power, main = "Global Active Power", col = 2, xlab = "Global Active Power (kilowatts)")
dev.off()