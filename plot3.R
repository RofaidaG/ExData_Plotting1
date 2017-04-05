fh <- file("household_power_consumption.txt")
EPC <- read.table(text = grep(
        "^[1,2]/2/2007", readLines(fh), value = TRUE),
        col.names = c("Date", "Time", "Global_active_power", 
                      "Global_reactive_power", "Voltage", 
                      "Global_intensity", "Sub_metering_1", 
                      "Sub_metering_2", "Sub_metering_3"), 
        sep = ";", header = TRUE, na.strings = "?")

png("plot3.png", 480, 480) #creating a png file and opening a png device

# plotting chart to the png file

all = paste(EPC$Date,EPC$Time)
all = strptime(all, "%d/%m/%Y %H:%M:%S")

plot(all,
     EPC$Sub_metering_1,
     type = "l",
     col= 'black', 
     xlab = "",
     ylab ="Energy sub metring"
     )

lines(all,
     EPC$Sub_metering_2,
     type = "l",
     col= 'red'
)

lines(all,
      EPC$Sub_metering_3,
      type = "l",
      col= 'blue'
)


legend("topright",col = c("black", "red", "blue"), 
          legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1
       )
## adding the legend


dev.off() # closing the png device

