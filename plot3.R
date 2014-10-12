houseHoldPowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
houseHoldPowerConsumption$Time <- strptime(paste(houseHoldPowerConsumption$Date, houseHoldPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
houseHoldPowerConsumption$Date <- as.Date(houseHoldPowerConsumption$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
houseHoldPowerConsumption <- subset(houseHoldPowerConsumption, Date %in% dates)

png("plot3.png", width=400, height=400)

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_2, col="red")
lines(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

dev.off()