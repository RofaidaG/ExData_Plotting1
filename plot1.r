fh <- file("household_power_consumption.txt")
EPC <- read.table(text = grep(
                             "^[1,2]/2/2007", readLines(fh), value = TRUE),
                  col.names = c("Date", "Time", "Global_active_power", 
                                "Global_reactive_power", "Voltage", 
                                "Global_intensity", "Sub_metering_1", 
                                "Sub_metering_2", "Sub_metering_3"), 
                  sep = ";", header = TRUE, na.strings = "?")


png("plot1.png", 480, 480) #creating a png file and opening a png device

# plotting the histogram to the png file
        
hist(EPC$Global_active_power,
     col="red", 
     xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")

dev.off() # closing the png device
