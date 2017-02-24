library(ggplot2)
library(reshape2)

if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

#extract the data specific to Los Angeles
la.motor = NEI[NEI$fips=="06037" & NEI$type== "ON-ROAD",c("year","Emissions")]
la.sum = aggregate(Emissions ~ year, la.motor, sum)
la.sum$city = paste(rep("Los Angeles",4))

#extract the data specific to Baltimore
balt.motor = NEI[NEI$fips=="24510" & NEI$type== "ON-ROAD",c("year","Emissions")]
balt.sum = aggregate(Emissions ~ year, balt.motor, sum)
balt.sum$city = paste(rep("Baltimore",4))

#reformat the data to make it easier to plot in ggplot
combined = rbind(la.sum,balt.sum)

png("plot6.png", width = 720)
ggplot(data = combined, aes(year,Emissions, color = city)) + 
    geom_line() + 
    ggtitle("Total Emissions of Motor Vehicle Sources from Baltimore vs. Los Angeles") +
    expand_limits(y= c(0,1.05*max(combined$Emissions))) +
    facet_grid(~ city)

dev.off()