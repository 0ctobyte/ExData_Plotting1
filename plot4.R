source("load_data.R")

# load_data.R puts the data.frame in the variable "data"
png("plot4.png", width = 480, height = 480)

# Create a matrix of plots
par(mfrow = c(2, 2))

# top left plot
plot(data$Datetime, data$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

# top right plot
plot(data$Datetime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# bottom left plot
plot(data$Datetime, data$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# bottom right plot
plot(data$Datetime, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")


dev.off()
