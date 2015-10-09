Sys.setlocale("LC_ALL", "C")

dataAll <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSub <- rbind(subset(dataAll, dataAll$Date == "1/2/2007"), subset(dataAll, dataAll$Date == "2/2/2007"))
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)

dataSub$Date <- as.Date(dataSub$Date, format = "%d/%m/%Y")
dataSub$DateTime <- as.POSIXct(paste(dataSub$Date, dataSub$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
with(dataSub, plot(DateTime, Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering"))
with(dataSub, lines(DateTime, Sub_metering_1))
with(dataSub, lines(DateTime, Sub_metering_2, col = 'red'))
with(dataSub, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1)

dev.off()