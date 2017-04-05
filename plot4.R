fh <- file("household_power_consumption.txt")
EPC <- read.table(text = grep(
        "^[1,2]/2/2007", readLines(fh), value = TRUE),
        col.names = c("Date", "Time", "Global_active_power", 
                      "Global_reactive_power", "Voltage", 
                      "Global_intensity", "Sub_metering_1", 
                      "Sub_metering_2", "Sub_metering_3"), 
        sep = ";", header = TRUE, na.strings = "?")

## preparing the x axis (time series)
all = paste(EPC$Date,EPC$Time)
all = strptime(all, "%d/%m/%Y %H:%M:%S")

png("plot4.png", 480, 480) #creating a png file and opening a png device

# plotting chart to the png file

## divide the screen to 2 by 2 matrix by columns
par(mfcol=c(2,2))

## add the already cretaed code for the first plot
plot(all,EPC$Global_active_power, type ="l", ylab="Global Active Power", xlab="")

##############################################################
## add the already cretaed code for the 2nd plot
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
##########################################################

## add the code for the 3rd plot
# x = all # Y = voltage # edit X label and Y label

plot(all, EPC$Voltage, xlab ="datetime", ylab="Voltage", type ="l")
##########################################################
## add the code for the 4th plot
# x = all # Y = global reactive power # edit X label and Y label
plot(all, EPC$Global_reactive_power, xlab ="datetime", ylab="Global Reactive power", type ="l")


dev.off() # closing the png device

