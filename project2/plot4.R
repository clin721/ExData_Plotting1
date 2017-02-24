
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

neiscc = merge(NEI,SCC, by="SCC")
#search for coal combustion-related sources
matches = grepl("coal",neiscc$Short.Name, ignore.case=TRUE)
neiscc1 = neiscc[matches,c("year","Emissions")]

coalsum = aggregate(Emissions ~ year, neiscc1, sum)

png("plot4.png")
plot(coalsum$year, coalsum$Emissions/1000, type="l",
     xlab="year", ylab="total PM2.5 emission (kilotons)",
     main="PM2.5 Emissions from Coal Combustion")

dev.off()
