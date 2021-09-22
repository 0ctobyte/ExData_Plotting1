source("load_data.R")

# load_data.R puts the data.frame in the variable "data"
png("plot2.png", width = 480, height = 480)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
