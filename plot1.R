dataurl <- "/Users/sujaynair/Downloads/household_power_consumption2.txt"
edata <- read.table(dataurl, header = TRUE, stringsAsFactors = FALSE, sep = ";")

actualdata <- edata[edata$Date %in% c("1/2/2007", "2/2/2007"),]

png("plot1.png", height = 480, width = 480)
hist(as.numeric(actualdata$`Global_active_power`), xlab="Global Active Power (kilowatts)"
           , col = "red", main = "Global Active Power")

dev.off()