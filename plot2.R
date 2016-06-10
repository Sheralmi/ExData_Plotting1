text<-"../Downloads/Expl/household_power_consumption.txt"
data <- read.table(text, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##use only data for two days
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(subset$Global_active_power)
time<-strptime(paste(subset$Date,subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 504, height=504)
plot(time,GAP,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
