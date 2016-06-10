text<-"../Downloads/Expl/household_power_consumption.txt"
data <- read.table(text, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##use only data for two days
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(subset$Global_active_power)
GRP<-as.numeric(subset$Global_reactive_power)
time<-strptime(paste(subset$Date,subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
submet1<-as.numeric(subset$Sub_metering_1)
submet2<-as.numeric(subset$Sub_metering_2)
submet3<-as.numeric(subset$Sub_metering_3)
volt<-as.numeric(subset$Voltage)

png("plot4.png",width = 504, height=504)
##Set 2X2 frame for plots
par(mfrow=c(2,2))
##Inserting plots left to right first row, then left to right second row

#1
plot(time,GAP,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#2
plot(time,volt,type="l", xlab="datetime", ylab="Voltage")

#3
plot(time,submet1,type="l", xlab="", ylab="Energy Submetering")
lines(time,submet2,type="l",col="red")
lines(time,submet3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"))

#4
plot(time, GRP,type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

