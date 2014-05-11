source("ReadingData.R")

Plot1 <- function() {
  Data <- ReadingData()
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  hist(Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}

Plot1()