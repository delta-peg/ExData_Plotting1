library(dplyr)

# read in the data
source("getData.R")
data = get_data()


# construct plot and save it as a PNG file
png("plot2.png", width = 480, height = 480)
with(data, plot(datetime, Global_active_power, 
                type="l",
                ylab = "Global Active Power (kilowatts)",
                xlab = ""))
dev.off()