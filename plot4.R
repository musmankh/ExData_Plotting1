library(data.table)
d <- fread("household_power_consumption.txt", sep = ";" , header=TRUE,na.strings = "?",colClasses = c("Character"),)[Date == "1/2/2007" | Date == "2/2/2007",]
d[,DateTime:=paste(d$Date,d$Time)]
x <- strptime(d$DateTime, format = ("%d/%m/%Y %H:%M:%S"))
y <- as.numeric(d$Sub_metering_1)
z <- as.numeric(d$Sub_metering_2)
a <- as.numeric(d$Sub_metering_3)
b <- as.numeric(d$Global_reactive_power)
c <- as.numeric(d$Voltage)
e <- as.numeric(d$Global_active_power)
par(mfcol = c(2,2))
par(mar= c(4,4,2,2))
with(d,{
    plot(x, e, xlab = "", ylab = "Global Active Power (Kilowatts)" , type = "l")
    
plot(x,y, type = "n", ylab = "Energy sub metering" , xlab = "")
lines(x,y, type = "l", col = "black")
lines(x,z, type = "l", col = "red")
lines(x,a, type = "l",col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), pt.cex=1,cex=0.5 , bty = "n")

plot(x, c, xlab = "datetime", ylab = "Voltage" , type = "l")
plot(x, b, xlab = "datetime" , ylab = "Global_reactive_power" , type = "l") 
})
dev.copy(png, file = "plot4.png")
dev.off
