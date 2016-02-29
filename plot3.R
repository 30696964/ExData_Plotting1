# Load dataset into R
Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# Subset the dataset to only use data from the dates 2007-02-01 and 2007-02-02
SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]

# Convert date and time variables to Date/Time class
FixTime <-strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

FinalData <- cbind(FixTime, SubsetData)

# Create plot 3
png("plot3.png", width=480, height=480)

plot(FinalData$FixTime, FinalData$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(FinalData$FixTime, FinalData$Sub_metering_2, col="red")
lines(FinalData$FixTime, FinalData$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()