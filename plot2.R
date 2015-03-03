setwd("C:\\Users\\bef\\Desktop\\exdata_data_household_power_consumption")


data_full<-read.csv("household_power_consumption.txt",sep=";",head=T,skip=0,na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


##plot2
plot(data$Datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()