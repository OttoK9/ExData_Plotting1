Sys.setlocale("LC_ALL", "C")

dataAll <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSub <- rbind(subset(dataAll, dataAll$Date == "1/2/2007"), subset(dataAll, dataAll$Date == "2/2/2007"))
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)

dataSub$Date <- as.Date(dataSub$Date, format = "%d/%m/%Y")
dataSub$DateTime <- as.POSIXct(paste(dataSub$Date, dataSub$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
with(dataSub, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'n'))
with(dataSub, lines(DateTime, Global_active_power))
dev.off()