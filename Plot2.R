library(dplyr)
library(lubridate)
# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip=66600, nrows=2880)

# clearing name row and unrelevant variables, casting to right classes
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

# create plot
with(data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))