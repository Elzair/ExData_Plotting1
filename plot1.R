plot1 <- function() {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method = "curl")
    unzip("data.zip")
    housedat <- read.table("household_power_consumption.txt", sep = ";",
                           header = TRUE, stringsAsFactors = FALSE)                 %>%
                mutate(Datetime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %T"),
                       Date = as.Date(Date, format = "%d/%m/%Y"),
                       Global_active_power = as.numeric(Global_active_power)) %>%
                filter(Date == "2007-02-01" | Date == "2007-02-02")
    png(file = "plot1.png", width = 480, height = 480)
    with(housedat, hist(Global_active_power, main = "Global Active Power",
                        xlab = "Global Active Power (kilowatts)", col = "red"))
    dev.off()
}
