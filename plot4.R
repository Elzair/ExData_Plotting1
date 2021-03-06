plot4 <- function() {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method = "curl")
    unzip("data.zip")
    housedat <- read.table("household_power_consumption.txt", sep = ";",
                           header = TRUE, stringsAsFactors = FALSE)           %>%
                mutate(Datetime = as.POSIXct(paste(Date, Time),
                                             format = "%d/%m/%Y %T"),
                       Date = as.Date(Date, format = "%d/%m/%Y"),
                       Global_active_power = as.numeric(Global_active_power)) %>%
                filter(Date == "2007-02-01" | Date == "2007-02-02")
    png(file = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2, 2))
    with(housedat, {
        plot(Datetime, Global_active_power, type = "l",
             xlab = "", ylab = "Global Active Power")
        plot(Datetime, Voltage, type = "l",
             xlab = "datetime", ylab = "Voltage")
        plot(Datetime, Sub_metering_1, type = "l",
             xlab = "", ylab = "Energy sub metering")
        lines(Datetime, Sub_metering_2, type = "l",
              col = "red")
        lines(Datetime, Sub_metering_3, type = "l",
              col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                      "Sub_metering_3"),
            lty = c(1, 1, 1), col = c("black", "red", "blue"))
        plot(Datetime, Global_reactive_power, type = "l",
             xlab = "datetime", ylab = "Global_reactive_power")
    })
    dev.off()
}
