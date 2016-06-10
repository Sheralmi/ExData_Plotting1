text<-"../Downloads/Expl/household_power_consumption.txt"
data <- read.table(text, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##use only data for two days
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(subset$Global_active_power)
time<-strptime(paste(subset$Date,subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
submet1<-as.numeric(subset$Sub_metering_1)
submet2<-as.numeric(subset$Sub_metering_2)
submet3<-as.numeric(subset$Sub_metering_3)
png("plot3.png",width = 504, height=504)
plot(time,submet1,type="l", xlab="", ylab="Energy Submetering")
lines(time,submet2,type="l",col="red")
lines(time,submet3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"))
dev.off()