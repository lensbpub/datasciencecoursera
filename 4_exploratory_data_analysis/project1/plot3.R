
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
png("plot3.png", width=480, height=480)


plot(power_dt[, dateTime], power_dt[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_dt[,dateTime], power_dt[,Sub_metering_2], col="red")
lines(power_dt[,dateTime], power_dt[,Sub_metering_3], col="blue")
legend("topright", col=c("black","red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))

dev.off()
