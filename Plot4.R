## Read the data
pc<-read.table("household_power_consumption.txt",header=T, sep=";")
## Create a subset for the two dates
df <- subset(pc, Date %in% c("1/2/2007", "2/2/2007"));
## Remove the original object, too big!!
rm(pc)
## Create the plot
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(2,2,2,1))

##Plot 1
glac<-as.numeric(as.character(df$Global_active_power)) 
plot(glac, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))

##Plot 2
volt<-as.numeric(as.character(df$Voltage)) 
plot(volt, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))

#Plot 3
vec1 <- as.numeric(as.character(df$Sub_metering_1));
vec2 <- as.numeric(as.character(df$Sub_metering_2));
vec3 <- as.numeric(as.character(df$Sub_metering_3));

plot(vec1, type="l", ylab="Energy sub metering", xlab="", xaxt="n", cex=0.5)
lines(vec2, col="red")
lines(vec3, col="blue")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))
legend("topright", bty="n", lty=1, cex=0.6, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot 4
glrp<-as.numeric(as.character(df$Global_reactive_power)) 
plot(glrp, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(1, at=c(0,1500,2900),lab=c("Thu","Fri","Sat"))

dev.copy(png, file = "Plot4.png")
dev.off()
