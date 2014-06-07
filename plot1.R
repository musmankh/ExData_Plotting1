d <- fread("household_power_consumption.txt", sep = ";" , header=TRUE,na.strings = "?",colClasses = c("Character"),)[Date == "1/2/2007" | Date == "2/2/2007",]
d <- transform(d, Date = as.Date(Date,format ="%d/%m/%Y"), Global_active_power = as.numeric(paste(Global_active_power)))
hist(d$Global_active_power, xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off