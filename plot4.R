Sys.setlocale("LC_ALL", "C")

dataAll <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSub <- rbind(subset(dataAll, dataAll$Date == "1/2/2007"), subset(dataAll, dataAll$Date == "2/2/2007"))
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)

dataSub$Date <- as.Date(dataSub$Date, format = "%d/%m/%Y")
dataSub$DateTime <- as.POSIXct(paste(dataSub$Date, dataSub$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
options(device = png)
par(mfrow = c(2,2))

with(dataSub, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'n'))
with(dataSub, lines(DateTime, Global_active_power))

with(dataSub, plot(DateTime, Voltage, type = 'n'))
with(dataSub, lines(DateTime, Voltage))

with(dataSub, plot(DateTime, Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering"))
with(dataSub, lines(DateTime, Sub_metering_1))
with(dataSub, lines(DateTime, Sub_metering_2, col = 'red'))
with(dataSub, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1)

with(dataSub, plot(DateTime, Global_reactive_power, type = 'n'))
with(dataSub, lines(DateTime, Global_reactive_power))

dev.off()