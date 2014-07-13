
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


png("plot2.png", height=480, width=480)

# combining date and time into one vector
date.time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))  

plot(x=date.time, 
     y = data$Global_active_power,
     type = "l", xlab = "", ylab= "Global Active Power (kilowatts)" )



dev.off()