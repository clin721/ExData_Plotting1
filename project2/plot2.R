
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

#extract the data specific to Baltimore
balt = subset(NEI, NEI$fips == "24510")

#sum the emissions from all sources based on the year
baltsum = with(balt, tapply(balt$Emissions,balt$year, sum, na.rm=T))

png("plot2.png")

barplot(baltsum, names.arg=c(1999,2002,2005,2008), 
        xlab="year", ylab="total PM2.5 emission",
        main="PM2.5 Emissions in Baltimore")
dev.off()