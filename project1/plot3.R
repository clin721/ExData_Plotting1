# loading and subsetting the data
filename = "../household_power_consumption.txt"
data1 = read.table(filename, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
data.sub = data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

# formatting the data and plotting it
png("plot3.png",width = 480, height = 480)
dateTime = strptime(paste(data.sub$Date,data.sub$Time), "%d/%m/%Y %H:%M:%S")
meter1 = as.numeric(data.sub$Sub_metering_1)
meter2 = as.numeric(data.sub$Sub_metering_2)
meter3 = data.sub$Sub_metering_3

plot(dateTime,meter1, type="l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dateTime,meter2, type = "l", col = "red")
lines(dateTime,meter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black","red","blue"))
dev.off()
