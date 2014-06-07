library(data.table)
d <- fread("household_power_consumption.txt", sep = ";" , header=TRUE,na.strings = "?",colClasses = c("Character"),)[Date == "1/2/2007" | Date == "2/2/2007",]
d[,DateTime:=paste(d$Date,d$Time)]
x <- strptime(d$DateTime, format = ("%d/%m/%Y %H:%M:%S"))
y <- as.numeric(d$Global_active_power)
plot(x, y, ylab = "Global Active Power (Kilowatts" , type = "l")
dev.copy(png, file = "plot2.png")
dev.off