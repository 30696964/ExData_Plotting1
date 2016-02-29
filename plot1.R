# Load dataset into R
Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# Subset the dataset to only use data from the dates 2007-02-01 and 2007-02-02
SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]

# Convert date and time variables to Date/Time class
FixTime <-strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

FinalData <- cbind(FixTime, SubsetData)

# Create plot 1
png("plot1.png", width=480, height=480)

hist(FinalData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
