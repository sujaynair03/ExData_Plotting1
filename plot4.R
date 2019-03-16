#download data
dataurl <- "/Users/sujaynair/Downloads/household_power_consumption.txt"
edata <- read.table(dataurl, header = TRUE, stringsAsFactors = FALSE
                    , sep = ";")
#select wanted days
actualdata <- edata[edata$Date %in% c("1/2/2007", "2/2/2007"),]
colnames(actualdata) <- gsub("_", " ", colnames(actualdata))
#create datetime object
dateTime <- as.POSIXct(paste(actualdata$Date, actualdata$Time)
                       , format="%d/%m/%Y %H:%M:%S")
#plot for global active power
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dateTime, actualdata[,"Global active power"], type = "l",
     ylab = "Global Active Power", ylim = c(0,6), xlab = "")
#plot for voltage and energy sub metering
plot(dateTime, actualdata$Voltage, type = "l", col = "black"
     , ylab = "Voltage", xlab = "datetime")
plot(dateTime,actualdata$`Sub metering 1`,type = "l", ylim = c(0,40), xlab = ""
     , ylab = "Energy sub metering")
lines(dateTime, actualdata$`Sub metering 1`, type = "l", col = "black")
lines(dateTime, actualdata$`Sub metering 2`, type = "l", col = "red")
lines(dateTime, actualdata$`Sub metering 3`, type = "l", col = "blue")
#create legend for energy sub metering
legend("topright", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
       , col = c("black", "red", "blue"), lty = 1:3)
#create plot for global reactive power
plot(dateTime, actualdata$`Global reactive power`, type = "l", col = "black"
     , ylab = "Global_Reactive_Power", xlab = "datetime")
dev.off()
