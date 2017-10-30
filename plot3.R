# Read file
household <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
housefinal <- subset(household, household$Date =="1/2/2007" | household$Date =="2/2/2007")

# Plot 3

# calling the basic plot functions
png("plot3.png", width=480, height=480)
plot(housefinal$Time,housefinal$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
