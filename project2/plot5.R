
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

#using grep didn't help much, so this is the closest thing I could think of
motor = NEI[NEI$fips=="24510" & NEI$type== "ON-ROAD",c("year","Emissions")]
motorsum = aggregate(Emissions ~ year, motor, sum)


png("plot5.png")

b=barplot(motorsum$Emissions, names.arg=motorsum$year,
     xlab="year", ylab="total PM2.5 emission",
     main="PM2.5 Emissions from Motor Vehicles")
text(b, motorsum$Emissions-15,round(motorsum$Emissions,2))

dev.off()