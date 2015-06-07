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

# Plot 2
plot(data_p$Global_active_power~data_p$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()