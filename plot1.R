#read the file into data
t1 <- read.table("../household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings=c("?"), header=TRUE)

#set the Date format
t1$Date <- as.Date(t1$Date, "%d/%m/%Y")

#subsetting the data that we want to focus on
sub <- t1[t1$Date == "2007-02-01" | t1$Date == "2007-02-02",]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")

#plotting using hist function
hist(sub$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")

#save the file to plot1.png
png(filename="plot1.png", width=480, height=480, units="px")
dev.off()
