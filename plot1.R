EPC <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
EPC$DateTime <- paste(EPC$Date,EPC$Time)
EPC$DateTime <- strptime(EPC$DateTime, "%d/%m/%Y %H:%M:%S")
EPC<-(EPC[,3:10])
StartDate <- as.Date("2007/02/01 0:0:0", format ="%Y/%m/%d %H:%M:%S")
EndDate <- as.Date("2007/02/02 23:59:59", format ="%Y/%m/%d %H:%M:%S")
EPC <- EPC[as.Date(EPC$DateTime, format ="%Y/%m/%d %H:%M:%S") >= as.Date(StartDate),]
EPC <- EPC[as.Date(EPC$DateTime, format ="%Y/%m/%d %H:%M:%S") <= as.Date(EndDate),]

png(file="plot1.png")
par(mfrow=c(1,1))
hist(EPC$Global_active_power, main="Global Active Power", col="red", breaks=15, xlab="Global Active Power (kilowatts)")
dev.off()