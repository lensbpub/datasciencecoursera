
library("data.table")

# Reading the data
power_dt <- data.table::fread(input="household_power_consumption.txt", na.strings="?")

# Prevent histogram from printing scientific notation
power_dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]
# Change to date type the date column
power_dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Get the corresponding dates
power_dt <- power_dt[(Date >= "2007-02-1") & (Date <= "2007-02-02")]

# Plot
png("plot1.png", width=480, height=480)
hist(power_dt[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)",
              ylab="Frequency", col="Red")

dev.off()