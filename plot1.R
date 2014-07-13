
raw_data = read.csv("household_power_consumption.txt",
                sep = ";")

raw_data$Date = as.Date(raw_data$Date, format="%d/%m/%Y")

data = subset(raw_data, Date == as.Date('2007-02-01') | 
             Date == as.Date('2007-02-2'))

# clear not required data
raw_data = ""

data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]


png("plot1.png", height=480, width=480)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()