plot1 <- function(file){
	file <- "household_power_consumption.txt"
	tempData <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
	data <- subset(tempData, tempData$Date == "2/2/2007" | tempData$Date == "1/2/2007")
	data["?"==data] <- NA
	data[,3] <- as.numeric(data[,3])
	png(file="plot1.png", height=480, width=480)	
	hist(data[,3], col="red", xlab="Global active Power(kW)", ylab="Frequency", main="Global Active Power")
	dev.off()
}