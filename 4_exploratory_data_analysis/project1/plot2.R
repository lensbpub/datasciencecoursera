

library("data.table")

# Reading the data
power_dt <- data.table::fread(input="household_power_consumption.txt", na.strings="?")

# Prevent histogram from printing scientific notation
power_dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]

# Make a POPSIXct date 
power_dt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]







# Get the corresponding dates
power_dt <- power_dt[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Plot
png("plot2.png", width=480, height=480)
plot(x=power_dt[, dateTime], y=power_dt[, Global_active_power], type="l", xlab="", 
                ylab="Global Active Power (kilowatts)")

dev.off()

