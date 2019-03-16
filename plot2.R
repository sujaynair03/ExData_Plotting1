dataurl <- "/Users/sujaynair/Downloads/household_power_consumption.txt"
edata <- read.table(dataurl, header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")

actualdata <- edata[edata$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- as.POSIXct(paste(actualdata$Date, actualdata$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(dateTime, actualdata[,"Global_active_power"], type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
