## Read the data
pc<-read.table("household_power_consumption.txt",header=T, sep=";")
## Create a subset for the two dates
df <- subset(pc, Date %in% c("1/2/2007", "2/2/2007"));
## Remove the original object, too big!!
rm(pc)
## Create the plot
glac<-as.numeric(as.character(df$Global_active_power)) 
plot(glac, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))
dev.copy(png, file = "Plot2.png")
dev.off()