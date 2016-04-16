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

## Creating Plot and Saving to PNG Graphics Device
png("plot1.png")
hist(required_data$Global_active_power,
     col= "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()