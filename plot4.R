
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
# converting from factor to numeric
data$Sub_metering_1 = as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 = as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Voltage = as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_reactive_power = as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]

png("plot4.png", height=480, width=480)

# combining date and time into one vector
date.time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))  

par(mfcol=c(2,2))


# ------------------------------
#             PLOT 1 
# ------------------------------

plot(x=date.time, 
     y = data$Global_active_power,
     type = "l", xlab = "", ylab= "Global Active Power (kilowatts)" )


# ------------------------------
#             PLOT 2 
# ------------------------------

plot(x=date.time, 
     y = data$Sub_metering_1,
     type = "l", xlab = "", ylab= "Energy sub metering", col = "black" )

lines(date.time, data$Sub_metering_2, type="l", col="red")
lines(date.time, data$Sub_metering_3, type = "l", col="blue")

legend("topright", lty="solid", bty= "n", cex= 0.9, col=c("black", "red", "blue" ), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



# ------------------------------
#             PLOT 3 
# ------------------------------

plot(x=date.time, 
     y = data$Voltage, type = "l", xlab = "datetime", ylab= "voltage" )


# -----------------------------
#           PLOT 4 
# -----------------------------

plot(x=date.time, 
     y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab= "global_reactive_power" )



dev.off()