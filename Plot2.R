# reading relevant data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# clearing name row and unrelevant variables, casting to right classes
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# create plot
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")