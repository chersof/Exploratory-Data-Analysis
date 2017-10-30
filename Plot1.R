# Read file
household <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
housefinal <- subset(household, household$Date =="1/2/2007" | household$Date =="2/2/2007")

## Plot 1

#calling the basic plot function
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(housefinal$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
