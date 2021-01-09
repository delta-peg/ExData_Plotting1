library(dplyr)

# read in the data
source("getData.R")
data = get_data()


# construct plot and save it as a PNG file
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data,{
  plot(datetime, Global_active_power, 
       type="l",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  
  plot(datetime, Voltage,
       type="l")
  
  plot(datetime, Sub_metering_1, 
       type="l",
       ylab = "Energy sub metering",
       xlab = "")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"),
         lty = 1)
  
  plot(datetime, Global_reactive_power,
       type="l")
} 
)

dev.off()
