plot1 <- function() {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method = "curl")
    unzip("data.zip")
    housedat <- read.table("household_power_consumption.txt", sep = ";", header = T)
    housedat <- housedat[housedat$Date == "1/2/2007" | housedat$Date == "2/2/2007",]
    housedat$Global_active_power <- as.numeric(housedat$Global_active_power) / 500
    hist(housedat$Global_active_power, main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)", col = "red")
}
