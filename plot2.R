plot2 <- function(file){
	file <- "household_power_consumption.txt"
	tempData <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
	data <- subset(tempData, tempData$Date == "2/2/2007" | tempData$Date == "1/2/2007")
	timestamp <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	data$Global_active_power <- as.numeric(data$Global_active_power)
	png("plot2.png", height=480, width=480)
	plot(timestamp, data$Global_active_power, type="line", xlab="", ylab="Global Active Power(kilowatts)")
	dev.off()
}