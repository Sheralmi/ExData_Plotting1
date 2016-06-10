text<-"../Downloads/Expl/household_power_consumption.txt"
data <- read.table(text, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##use only data for two days
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(subset$Global_active_power)
##open device, set size as of the sample plot
png("plot1.png",width = 504, height=504)
hist(GAP, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
##close png
dev.off()
