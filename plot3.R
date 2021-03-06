## This R code file assumes that you have downlaoded and unzipped the data in your working directory with original file names.

## Reading Data
data<- read.table("./household_power_consumption.txt",
                  sep = ";",
                  header = TRUE,
                  na.strings = c("?"), 
                  colClasses = "character")

## Removing Missing Values
data <- na.omit(data)

## Converting Date Values
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

## Getting Required Data
required_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

## Creating Datetime Object
datetime <- paste(required_data$Date, required_data$Time)
required_data$date_time <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

## Creating Plot and Saving to PNG Graphics Device
png("plot3.png")
plot(required_data$date_time, 
     required_data$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering",
     xlab = "")
lines(required_data$date_time, required_data$Sub_metering_2, col= "red")
lines(required_data$date_time, required_data$Sub_metering_3, col= "blue")
legend("topright", 
       lty = c(1,1,1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()