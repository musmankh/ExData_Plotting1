library(data.table)
d <- fread("household_power_consumption.txt", sep = ";" , header=TRUE,na.strings = "?",colClasses = c("Character"),)[Date == "1/2/2007" | Date == "2/2/2007",]
d[,DateTime:=paste(d$Date,d$Time)]
x <- strptime(d$DateTime, format = ("%d/%m/%Y %H:%M:%S"))
y <- as.numeric(d$Sub_metering_1)
z <- as.numeric(d$Sub_metering_2)
a <- as.numeric(d$Sub_metering_3)
with(d, plot(x,y, type = "n", ylab = "Energy sub metering" , xlab = ""))
lines(x,y, type = "l", col = "black")
lines(x,z, type = "l", col = "red")
lines(x,a, type = "l",col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
dev.copy(png, file = "plot3.png")
dev.off

