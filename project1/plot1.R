# loading and subsetting the data
filename = "../household_power_consumption.txt"
data1 = read.table(filename, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
data.sub = data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

# formatting the data and plotting it
png("plot1.png",width = 480, height = 480)
globActPow = as.numeric(data.sub$Global_active_power)
hist(globActPow, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()