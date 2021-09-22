source("load_data.R")

# load_data.R puts the data.frame in the variable "data"
png("plot3.png", width = 480, height = 480)
plot(data$Datetime, data$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
