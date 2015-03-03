setwd("C:\\Users\\bef\\Desktop\\exdata_data_household_power_consumption")


data_full<-read.csv("household_power_consumption.txt",sep=";",head=T,skip=0,na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


##plot3
plot(data$Datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
