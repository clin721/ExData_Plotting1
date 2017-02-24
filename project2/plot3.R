library(ggplot2)
library(reshape2)

if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

#extract the data specific to Baltimore
balt = subset(NEI, NEI$fips == "24510")

#sum the emissions from all sources based on the year and type
typesum = with(balt, tapply(balt$Emissions,list(balt$year,balt$type), sum, na.rm=T))

#reformat the data to make it easier to plot in ggplot
typesum = melt(typesum)
names(typesum) = c("year","type","value")

png("plot3.png", width = 960)
ggplot(data = typesum, aes(year,value, color = type)) + 
    geom_line() + 
    expand_limits(y= c(0,1.05*max(typesum$value))) +
    facet_grid(~ type)

dev.off()