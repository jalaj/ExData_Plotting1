## Read the data
pc<-read.table("household_power_consumption.txt",header=T, sep=";")
## Create a subset for the two dates
df <- subset(pc, Date %in% c("1/2/2007", "2/2/2007"));
## Remove the original object, too big!!
rm(pc)
## Create the plot
vec1 <- as.numeric(as.character(df$Sub_metering_1));
vec2 <- as.numeric(as.character(df$Sub_metering_2));
vec3 <- as.numeric(as.character(df$Sub_metering_3));

plot(vec1, type="l", ylab="Energy sub metering", xlab="", xaxt="n", cex=0.5)
lines(vec2, col="red")
lines(vec3, col="blue")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))
legend("topright", bty="o", lty=1, xjust=0.5, cex=0.9, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot3.png")
dev.off()
