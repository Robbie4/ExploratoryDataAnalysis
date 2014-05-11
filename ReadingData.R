DownloadFile <- function(FileURL, FileName) {
  if(!file.exists(FileName)) {
    download.file(FileURL, destfile = FileName, method="curl")
  }
  FileName
}

ReadingData <- function() {
  CacheFile <- "PlotData.csv"
  if(file.exists(CacheFile)) {
    Data <- read.csv(CacheFile)
    Data$DateTime <- strptime(Data$DateTime, "%Y-%m-%d %H:%M:%S")
  }
  else {
    FileName <- DownloadFile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
    con <- unz(FileName, "household_power_consumption.txt")
    Data <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    Data <- Data[(Data$Date == "1/2/2007") | (Data$Date == "2/2/2007"),]
    Data$DateTime <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(Data, CacheFile)
  }
  Data
}