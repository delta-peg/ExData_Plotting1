library(dplyr)
library(readr)
library(lubridate)

get_data <- function() {
  if(!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
  }
  
  data <- read_delim("data.zip", delim = ";", na = "?")
  
  # filtering on dates based on character is always shaky. For safety, convert it to Date
  data$Date = dmy(data$Date)
  
  # filter to the dates 2007-02-01 and 2007-02-02
  data = data[data$Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")),]
  
  # create column with datetimes for easy timeseries plotting
  data = data %>% 
    mutate(datetime=lubridate::as_datetime(paste(data$Date, data$Time)), .before=1)
  
  return(data)
  
}

