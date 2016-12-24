# reading relevant data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# clearing name row and unrelevant variables, creating numerics
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# create histogram
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")