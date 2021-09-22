library(dplyr)

saved_filename <- "household_power_consumption_modified.csv"

if (!file.exists(saved_filename)) {
    # Download file, unzip and read data
    temp <- tempfile()
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = temp)
    data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
    unlink(temp)

    # Condition the Date and Time columns into one column
    data <- data %>% mutate(Datetime = as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))

    # Select only the period between 2007-02-01 to 2007-02-02 and order it
    data <- subset(data, Datetime >= "2007-02-01 00:00:00" & Datetime < "2007-02-03 00:01:00")
    data <- data[order(data$Datetime),]

    # Save it to disk
    write.csv(data, file = saved_filename)
} else {
    data <- read.csv(saved_filename)
    data$Datetime <- as.POSIXlt(data$Datetime)
}
