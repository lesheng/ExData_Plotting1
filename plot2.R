### Note: If the data has been downloaded and unzipped, please make sure the file name is
### "household_power_consumption.txt" so the data can be read properly.
### If the data hasn't been downloaded, please uncomment the following three lines, which will download the data and unzip it. 
# fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileUrl,destfile="household_power_consumption.zip")
# unzip("household_power_consumption.zip", exdir=".")

# read the data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

# only sue the data from the dates 2007-02-01 and 2007-02-02
power_subset <- filter(power,Date %in% c("1/2/2007","2/2/2007"))

# add a new column "dateTime".
power_subset$dateTime <- strptime(paste(power_subset$Date,power_subset$Time),"%d/%m/%Y %H:%M:%S")

# open png device
png(file="plot2.png", width = 480, height = 480, units="px")

# set the canvas
par(mfrow = c(1, 1))

# make the plot
plot(power_subset$dateTime,power_subset$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the device
dev.off()
