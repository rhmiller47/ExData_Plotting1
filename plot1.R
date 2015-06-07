# Importing the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset of the data  (2007-02-01 and 2007-02-02)
date1 <-"2007-02-01"
date2 <-"2007-02-02"
data_p <- subset(data, subset=(Date >= date1 & Date <= date2))

# Plot 1
hist(data_p$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()