# the dataset was saved in the data subfolder after obtaining it from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
dataFile <- "data/household_power_consumption.txt"

# it is known that the 66637th row is the first data row for 2007-02-01
firstRow = 66637

# it is also known that there are 2880 rows of data until we are out of range at 2007-02-03
numberOfRows = 2880

oneRow <- read.table(dataFile, header=TRUE, sep=";", nrows=1)
data <- read.table(dataFile, sep=";", skip=firstRow, nrows=numberOfRows)
colnames(data) <- colnames(oneRow)

data$Time <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

png(filename="plot2.png", width=480, height=480, units="px")
with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()