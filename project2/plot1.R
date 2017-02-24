
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}


#sum the emissions from all sources based on the year
yearsum = with(NEI, tapply(NEI$Emissions,NEI$year, sum, na.rm=T))

png("plot1.png")

barplot(yearsum, names.arg=c(1999,2002,2005,2008), 
        xlab="year", ylab="total PM2.5 emission",
        main="PM2.5 Emissions in US")
dev.off()