# Read file
household <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
housefinal <- subset(household, household$Date =="1/2/2007" | household$Date =="2/2/2007")

## Plot 2

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
housefinal$Date <- as.Date(housefinal$Date, format = "%d/%m/%Y")
housefinal$Time <- strptime(housefinal$Time, format="%H:%M:%S")

housefinal[1:1440,"Time"] <- format(housefinal[1:1440,"Time"],"2007-02-01 %H:%M:%S")
housefinal[1441:2880,"Time"] <- format(housefinal[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot function
png("plot2.png", width=480, height=480)
plot(housefinal$Time,as.numeric(as.character(housefinal$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()