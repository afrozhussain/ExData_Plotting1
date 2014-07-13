
# reading data file
raw_data = read.csv("household_power_consumption.txt",
                    sep = ";")

# converting Date column from factor to date
raw_data$Date = as.Date(raw_data$Date, format="%d/%m/%Y")

# subsetting data for only two days
data = subset(raw_data, Date == as.Date('2007-02-01') | 
                Date == as.Date('2007-02-2'))

# clear not required data
raw_data = ""

# converting class of 'Global Active Power' from factor to numeric
data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]
# converting factor to numeric
data$Sub_metering_1 = as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 = as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]


png("plot3.png", height=480, width=480)

# combining date and time into one vector
date.time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))  

plot(x=date.time, 
     y = data$Sub_metering_1,
     type = "l", xlab = "", ylab= "Energy sub metering", col = "black" )

lines(date.time, data$Sub_metering_2, type="l", col="red")
lines(date.time, data$Sub_metering_3, type = "l", col="blue")

legend("topright", lty="solid", col=c("black", "red", "blue" ), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()