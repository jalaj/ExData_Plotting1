## Read the data
pc<-read.table("household_power_consumption.txt",header=T, sep=";")
## Create a subset for the two dates
df <- subset(pc, Date %in% c("1/2/2007", "2/2/2007"));
## Remove the original object, too big!!
rm(pc)
## Crete the plot
histdata<-as.numeric(as.character(df$Global_active_power))
dev.copy(png, file = "Plot1.png")
dev.off()