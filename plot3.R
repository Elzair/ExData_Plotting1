plot3 <- function() {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method = "curl")
    unzip("data.zip")
    housedat <- read.table("household_power_consumption.txt", sep = ";",
                           header = TRUE, stringsAsFactors = FALSE)           %>%
                mutate(Datetime = as.POSIXct(paste(Date, Time),
                                             format = "%d/%m/%Y %T"),
                       Date = as.Date(Date, format = "%d/%m/%Y"),
                       Global_active_power = as.numeric(Global_active_power)) %>%
                filter(Date == "2007-02-01" | Date == "2007-02-02")
    png(file = "plot3.png", width = 480, height = 480)
    plot(housedat$Datetime, housedat$Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(housedat$Datetime, housedat$Sub_metering_2, type = "l", col = "red")
    lines(housedat$Datetime, housedat$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1, 1), col = c("black", "red", "blue"))
    dev.off()
}
