# read in the data
source("getData.R")
data = get_data()

# construct plot and save it as a PNG file
png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, col = "red", main = "Global Active Power"))
dev.off()
