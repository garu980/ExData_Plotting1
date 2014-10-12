houseHoldPowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
houseHoldPowerConsumption$Time <- strptime(paste(houseHoldPowerConsumption$Date, houseHoldPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
houseHoldPowerConsumption$Date <- as.Date(houseHoldPowerConsumption$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
houseHoldPowerConsumption <- subset(houseHoldPowerConsumption, Date %in% dates)

png("plot4.png", width=400, height=400)
par(mfrow=c(2,2))

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Voltage, type="l",xlab="datetime", ylab="Voltage")

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_2, col="red")
lines(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,box.lwd=0)

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
lines(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Global_reactive_power)

dev.off()