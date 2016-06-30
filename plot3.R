plot3 <- function(file){
	file <- "household_power_consumption.txt"
	tempData <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
	data <- subset(tempData, tempData$Date == "2/2/2007" | tempData$Date == "1/2/2007")
	timestamp <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
	data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
	data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
	png("plot3.png", height=480, width=480)
	plot(timestamp, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy Sub-metering")
	lines(timestamp, data$Sub_metering_2, col="red", type="l")
	lines(timestamp, data$Sub_metering_3, col="blue", type="l")
	legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))
	dev.off()
}