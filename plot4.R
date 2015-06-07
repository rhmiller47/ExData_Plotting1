# Importing the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset of the data  (2007-02-01 and 2007-02-02)
date1 <-"2007-02-01"
date2 <-"2007-02-02"
data_p <- subset(data, subset=(Date >= date1 & Date <= date2))

#Converting dates
datetime <- paste(as.Date(data_p$Date), data_p$Time)
data_p$Datetime <- as.POSIXct(datetime)

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_p, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

# Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()