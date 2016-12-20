# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, creating numerics
data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# create histogram
hist(data$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")