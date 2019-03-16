dataurl <- "/Users/sujaynair/Downloads/household_power_consumption.txt"
edata <- read.table(dataurl, header = TRUE, stringsAsFactors = FALSE
                    , sep = ";")
actualdata <- edata[edata$Date %in% c("1/2/2007", "2/2/2007"),]
colnames(actualdata) <- gsub("_", " ", colnames(actualdata))

dateTime <- as.POSIXct(paste(actualdata$Date, actualdata$Time), format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width = 480, height = 480)

plot(dateTime, as.numeric(actualdata$`Sub metering 1`), type = "l", col = "black"
     , ylab = "Energy sub metering", xlab = "")
lines(dateTime, as.numeric(actualdata$`Sub metering 2`), type = "l", col = "red")
lines(dateTime, as.numeric(actualdata$`Sub metering 3`), type = "l", col = "blue")
legend("topright", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
                                , col = c("black", "red", "blue"), lty = 1:3)
dev.off()
#for submetering1plot, y axis is subm1, for 2 y is sm2 for 3 3