# Read file
household <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
housefinal <- subset(household, household$Date =="1/2/2007" | household$Date =="2/2/2007")

# Plot 4

# initiating a composite plot with many graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(housefinal,{
    plot(housefinal$Time,as.numeric(as.character(housefinal$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(housefinal$Time,as.numeric(as.character(housefinal$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(housefinal$Time,housefinal$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(housefinal,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(housefinal$Time,as.numeric(as.character(housefinal$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
