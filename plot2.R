houseHoldPowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
houseHoldPowerConsumption$Time <- strptime(paste(houseHoldPowerConsumption$Date, houseHoldPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
houseHoldPowerConsumption$Date <- as.Date(houseHoldPowerConsumption$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
houseHoldPowerConsumption <- subset(houseHoldPowerConsumption, Date %in% dates)

png("plot2.png", width=400, height=400)

plot(houseHoldPowerConsumption$Time, houseHoldPowerConsumption$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()